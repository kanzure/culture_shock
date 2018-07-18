"""
Based on:
  example for:
  -- linked timers, slave in trigger mode, i.e. counter enabled from the master
  -- (slave) timer in one-pulse-mode with repetition
  https://community.st.com/thread/39151-one-pulse-with-repitition-counter

Definitions:

CEN -- The counter is clocked by the prescaler output CK_CNT, which is enabled only when the
       counter enable bit (CEN) in TIMx_CR1 register is set (refer also to the slave mode controller
       description to get more details on counter enabling).
       Note that the counter starts counting 1 clock cycle after setting the CEN bit in the TIMx_CR1
       register.

"""


import micropython
micropython.alloc_emergency_exception_buf(100)
import stm
import pyb
import array
from math import ceil
from pyb import Timer
from machine import Pin
from machine import I2C
from stm_low_level import *
from nvic import *
try:
  import ssd1306
except:
  # OLED support won't be available
  pass


period = 265
width = 1
number_of_pulse_pairs = 5
common_prescaler = 11

enable_gpio_and_timers()
# PYFLEX_F401 pin LED_YELLOW,PB9  ==> pyflex_f401.sch LED_YELLOW,PB9
YEL_LED = Pin('LED_YELLOW', Pin.OUT) 
# EN_18V_ONBOARD is active LO, (drives base of Q32), so turn on at start.
EN_18V_ONBOARD = Pin('PB14', Pin.OUT) 


# Setup ADC Timer and a callback to try printing the value
#adc_vals = [-1 for i in range(number_of_pulse_pairs+1 if number_of_pulse_pairs+1 > 128 else 128)]
#t4 = pyb.Timer(4, prescaler=0, period=0)
#stm.mem16[stm.TIM4 + stm.TIM_CR1] &= (~1) & 0xFFFF# disable CEN
#adc_timer = t4.channel(4, pyb.Timer.PWM)#OC_TIMING, polarity=pyb.Timer.HIGH)
#stm.mem16[stm.TIM4 + stm.TIM_CR1] &= (~1) & 0xFFFF# disable CEN

# PYFLEX_F401 pin JA2 ==> pyflex_f401.sch JA2 ==> chip PA4
adc = pyb.ADC(pyb.Pin.board.JA2) 
adc_vals = array.array('H',[0 for i in range(2048)])
stm.mem32[stm.ADC1 + stm.ADC_CR2] |= 1   #enable ADC
adc.read_timed(adc_vals)
adc.read_timed_stop()


def reset_vals():
  global adc_vals
  for i in range(len(adc_vals)):
    adc_vals[i] = 0


### display
# create software mode (-1) I2C peripheral at frequency of 400kHz
# PYFLEX_F401 pin JB6,PB6 ==> pyflex_f401.sch JB6,PB6
# PYFLEX_F401 pin JB7,PB7 ==> pyflex_f401.sch JB7,PB7
i2c = I2C(-1, scl=pyb.Pin.board.JB6, sda=pyb.Pin.board.JB7, freq=40000) # was 400000
ssd = None

# scan for slaves, returning a list of 7-bit addresses
if i2c.scan():
  ssd = ssd1306.SSD1306_I2C(128, 64, i2c, addr=0x3c)

# just a fun test for displaying text
def banner():
  # text, x, y, color
  ssd.framebuf.text('Culture_Shock!',0,0, 0xffff)
  ssd.framebuf.text('by', 0, 18, 0xffff)
  ssd.framebuf.text('JohnG', 0, 27, 0xffff)
  ssd.framebuf.text('NMZ787', 0, 36, 0xffff)
  ssd.framebuf.text('and kanzure!', 0, 45, 0xffff)
  ssd.show()

if ssd:
  banner()

# some test content for the OLED graphing, should result in a triangle
def test_graph():
  global adc_vals
  f=0
  for i in range(len(adc_vals)):
    # increase the value until the half-way point
    if (i<len(adc_vals)//2):
      f=i
    # then start decreasing
    else:
      f-=1
    # scale the values to max 1024, then store
    adc_vals[i] = int((f/len(adc_vals))*1024.)

# scaling for ADC... full-scale is 1024, but it can also be reduced to make it amplified looking, (digital zoom with lower res.)
# TODO adjust from button/touchscreen? Maybe be able to adjust X stretch too?
adc_max_val = 1024.
adc_max_val = 128.

# call this after pulsing
def graph():
  global adc_vals
  global ssd
  global adc_max_val
  ssd.fill(1)
  ssd.fill(0)
  # figure out how many ADC samples will have to be averaged/filtered together
  chunk_size = len(adc_vals)//128
  # step through each chunk
  for i in range(0, len(adc_vals), chunk_size):
    avg = 0
    # loop through each value in this chunk
    for j in range(chunk_size):
      avg += adc_vals[i+j]
    # divide to get the average
    avg = avg//chunk_size
    # draw a line (x1,y1, x2,y2, color)
    ssd.framebuf.line(i//chunk_size, 64, i//chunk_size, 64-int((avg/adc_max_val*64.)), 1)
    # use this for inverted Y output
    # ssd.framebuf.line(i//chunk_size, 0, i//chunk_size, int((avg/adc_max_val*64.)), 1)
  ssd.show()


class OnePulseOverFlowCounter(object):
  def __init__(self, t1):
    self.longer_counter = 0
    self._longer_counter = 0
    self.tail_end = 0
    self.or_in_end = 0
    self.disable_cen_val = (~1) & 0xFFFF # disable CEN on ADC
    self.cr1 = stm.mem16[stm.TIM1 + stm.TIM_CR1] & (~1 & two_byte_mask)
    t1.callback(self.end_of_n_pulse_train__longer)

  def set_longer_counter(self, number_pulses):
    global number_of_pulse_pairs
    number_of_pulse_pairs = number_pulses
    self.cr1 = stm.mem16[stm.TIM1 + stm.TIM_CR1] & (~1 & two_byte_mask)
    if number_pulses is not None and number_pulses>128: # since RCR==0 yields one pulse, we SHOULD get an extra
      self.longer_counter = int((number_pulses-1) / 128.)
      self._longer_counter = self.longer_counter
      self.tail_end = (number_pulses % 128)
      self.or_in_end = (((self.tail_end*2)-1) & 0xff)
      # if self.tail_end==1 and self.longer_counter>1 and self.or_in_end>0:
      #  self.or_in_end -= 1
      
      #self.or_in_end = 0
      print('longer: {} tail: {} or in end: {}'.format(self.longer_counter, self.tail_end, self.or_in_end))
      self.or_in_end = ((stm.mem16[stm.TIM1 + stm.TIM_RCR] & 0xff<<8) 
                                             | self.or_in_end) 
      if self.tail_end == 1 and self.longer_counter<=1:
        adjust_tim1_pulses(127)
      else:
        adjust_tim1_pulses(128)
      # stm.mem16[stm.TIM1 + stm.TIM_CR1]  |= (0
      #  #| 0b11<<5  # center aligned
      #  | (1 << TIM_CR1_OPM)   # want one-time mode
      # )
      #stm.mem16[stm.TIM1 + stm.TIM_RCR] = stm.mem16[stm.TIM1 + stm.TIM_RCR] & 0xff<<8 # 0 RCR
      stm.mem16[stm.TIM1 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask # disable OPM
    else:#t1 = pyb.Timer(1, prescaler=common_prescaler, period=two_byte_mask, callback=end_of_n_pulse_train__longer)#end_of_n_pulse_train_pa1_first)
      stm.mem16[stm.TIM1 + stm.TIM_CR1]  |= (0
        #| 0b11<<5  # center aligned
        | (1 << TIM_CR1_OPM)   # want one-time mode
      )
      self.longer_counter = 0
      self._longer_counter = self.longer_counter
      print('longer: {} tail: {} pulses: {}'.format(self.longer_counter, self.tail_end, number_pulses))
      adjust_tim1_pulses(number_pulses)


  def end_of_n_pulse_train__longer(self, t):
    """ Writing the timer callback inside a Class allows us to have persistent data. TODO: is that true? do we need the Class?"""
    import stm
    if self.longer_counter == 0:
      stm.mem16[stm.TIM5 + stm.TIM_CR1] |= 0b1000 # enable OPM
      stm.mem16[stm.TIM2 + stm.TIM_CR1] |= 0b1000 # enable OPM
      stm.mem16[stm.TIM1 + stm.TIM_CR1] = self.cr1

#      stm.mem32[stm.GPIOB + stm.GPIO_ODR] = 0
      stm.mem16[stm.TIM4 + stm.TIM_CR1] &= self.disable_cen_val # disable CEN on ADC
    else:
      if self.longer_counter == 1:
          stm.mem16[stm.TIM1 + stm.TIM_CR1] |= 0b1000 # OPM
      elif self.longer_counter == 2:
          stm.mem16[stm.TIM1 + stm.TIM_RCR] = self.or_in_end

      self.longer_counter = (self.longer_counter - 1) & 0xFFFF


#t1 = pyb.Timer(1, prescaler=common_prescaler, period=two_byte_mask, callback=end_of_n_pulse_train__longer)#end_of_n_pulse_train_pa1_first)
rep_counter_overflow_detector = OnePulseOverFlowCounter(pyb.Timer(1, prescaler=common_prescaler, period=two_byte_mask))

tim2_channel = 3
tim2_3_out = pyb.Pin(pyb.Pin.cpu.A2, pyb.Pin.AF_PP, pyb.Pin.PULL_NONE, 1)  # PA2 set to AF1 --> TIM2_CH3
tim5_2_out = pyb.Pin(pyb.Pin.cpu.A1, pyb.Pin.AF_PP, pyb.Pin.PULL_NONE, 2)  # PA1 set to AF2 -->  TIM5_CH2

# enable_pb13_af_and_connect_to_tim1()  2018-7-16-jg

# as long as both TIM's tick at AHB freq, the TIM's will tick at the same rate;
# should there be any APB divider impacting TIM input clock freq,
# this has to be factored in (individually per timer, as they are on different APBs)


def a(period, width, number_pulses=None):
  """ adjust the HV pulser's pulse-to-pulse period, pulse width, and number of push-pull pulse-pairs """
  global number_of_pulse_pairs
  global tim2_channel
  number_of_pulse_pairs = number_pulses
  adjust_tim5(period, width)
  adjust_tim2(period, width, tim2_channel)
  adjust_tim1(period, period//2, number_pulses)
  rep_counter_overflow_detector.set_longer_counter(number_pulses)

def q(num):
  """ adjust number of pulses for quick-pulsing that seems to produce HV low ripple """
  a(150,4,num)
  pulse()

# aa, b, and c are functions that I used during debug of overflow detection
# (N-pulse counter can hold 255, since we have pairs, that is 127 pairs)... so this was testing the interface of overflow
def aa():
  a(150,4,127)
  pulse()

def b():
  a(44,20,8)
  pulse()

def c():
  a(150,4,129)
  pulse()

def d():
  aa();pulse()
  b();pulse()
  c();pulse()


# rewrite setup_slave_timer() to include chunk of 8 bits CCMR settings including pwm mode.
# chunk of 8 bits CCMR settings ==>  OCxCE_OCxM_OCxPE_OCxFE_CCxS parameter
slave_tim = setup_slave_timer('TIM5', 2, 'TIM3', common_prescaler, period, width)
slave_tim = setup_slave_timer('TIM2', tim2_channel, 'TIM3', common_prescaler, period, width)
tim_kickoff = setup_n_pulse_kickoff_timer("TIM3", 1, common_prescaler, period, width)


# now setup TIM1 - we want it to disable itself i.e. one-pulse mode; 3 pulses, that goes to repetition counter - as the window is cca 600ms, let make them 50ms ON / 50ms OFF
stm.mem16[stm.TIM1 + stm.TIM_PSC] = common_prescaler
adjust_tim1(period=period, width=period//2, number_pulses=number_of_pulse_pairs)

# 15 14 13 12 11 10 9 8 7 6   5    4    3    2    1    0
# Reserved                TG  Res. CC4G CC3G CC2G CC1G UG
TIM_EGR_UG = 1
#stm.mem16[stm.TIM1 + stm.TIM_EGR] = TIM_EGR_UG         # through forced update load prescaler from shadow
# (CCMR1)
# 15     14 13 12   11    10     9 8      7    6 5 4      3     2      1 0
# OC2CE OC2M[2:0] OC2PE OC2FE CC2S[1:0] OC1CE OC1M[2:0] OC1PE OC1FE CC1S[1:0]

stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = (0
  | (TIM_CCMR_CCS__OUTPUT << TIM_CCMR1_CC1S_0)  # output compare
  | (TIM_CCMR_OCM__PWM2   << TIM_CCMR1_OC1M_0))

#3     2  
#CC1NP CC1NE
TIM_CCER_CC1NP = 3
TIM_CCER_CC1NE = 2
TIM_CCER_CC1P = 1
TIM_CCER_CC1E = 0
stm.mem16[stm.TIM1 + stm.TIM_CCER] |= (0
  #| (1 << TIM_CCER_CC1P)
  #| (1 << TIM_CCER_CC1NP)  # invert it to compensate for it being the CHxN channel (we might have selected the other PWM mode in CCMR as well)
  | (1 << TIM_CCER_CC1NE))  # enable TIM1_CH1N

# 15  14  13  12  11   10   9 8       7 6 5 4 3 2 1 0
# MOE AOE BKP BKE OSSR OSSI LOCK[1:0] DTG[7:0]
TIM_BDTR_MOE = 15
stm.mem16[stm.TIM1 + stm.TIM_BDTR] &= ~0xff&two_byte_mask      #ensure no delay (wasn't a problem, but I tried it)
stm.mem16[stm.TIM1 + stm.TIM_BDTR] |= 0  | (1 << TIM_BDTR_MOE)    # and the advanced-timers' gotcha: main output enable

set_slave_mode_and_trigger_source('TIM1', 'TIM3')

# 15 14 13 12 11 10   9 8     7   6 5  4   3   2    1   0
#       Reserved    CKD[1:0] ARPE CMS DIR OPM URS UDIS CEN
stm.mem16[stm.TIM1 + stm.TIM_CR1]  &= ~(0b11<<5) & two_byte_mask # Enable edge-aligned counting mode
stm.mem16[stm.TIM1 + stm.TIM_CR1]  |= (0
   #| 0b11<<5  # center aligned
   | (1 << TIM_CR1_OPM)   # want one-time mode
  )
#stm.mem16[stm.TIM1 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask # disable OPM


@micropython.native
def pulse():
  global number_of_pulse_pairs
  global adc_vals
  global adc
  pyb.disable_irq()
  # TODO: check these two have any effect, I thought they might prevent a pending GPIO toggle
  # stm.mem32[stm.TIM5 + stm.TIM_EGR] &= 0xff<<8 #|= 1
  # stm.mem32[stm.TIM2 + stm.TIM_EGR] &= 0xff<<8 #|= 1
  force_inactive_tim1()
  force_inactive_tim2()
  force_inactive_tim5()
  rep_counter_overflow_detector.set_longer_counter(number_of_pulse_pairs)
  stm.mem32[stm.TIM5 + stm.TIM_EGR] |= 1 # UG: Update generation is set updates registers, inits counter.
  stm.mem32[stm.TIM3 + stm.TIM_EGR] |= 1
  stm.mem32[stm.TIM2 + stm.TIM_EGR] |= 1
  stm.mem32[stm.TIM4 + stm.TIM_EGR] |= 1
  stm.mem32[stm.TIM1 + stm.TIM_EGR] |= 1  # gotta do this, or the num-pulses won't register (if it was just changed)

  # reset the counters to their default values (mostly 0, but some offset)
  stm.mem16[stm.TIM1 + stm.TIM_CNT] = 0
  #stm.mem16[stm.TIM1 + stm.TIM_CNT] = (stm.mem32[stm.TIM1 + stm.TIM_ARR] // 2) + (2* get_tim5_width1())+2
  stm.mem16[stm.TIM1 + stm.TIM_CNT] = stm.mem32[stm.TIM1 + stm.TIM_ARR] # it seems TIM1 is running at double the freq TIM2/5
  stm.mem32[stm.TIM2 + stm.TIM_CNT] = 0#stm.mem32[stm.TIM2 + stm.TIM_ARR] //2
  stm.mem32[stm.TIM3 + stm.TIM_CNT] = 0
  stm.mem32[stm.TIM4 + stm.TIM_CNT] = stm.mem32[stm.TIM5 + stm.TIM_ARR] //2
  # offset TIM5 phase by 180 degrees relative to TIM2
  stm.mem32[stm.TIM5 + stm.TIM_CNT] = stm.mem32[stm.TIM5 + stm.TIM_ARR] //2   # offset TIM5 counter by half-the pulse-width

  tim2_3_set_pwm2()
  tim5_set_pwm2()
  tim1_1_set_pwm2()
  
  # enable OPM
  stm.mem16[tim_kickoff + stm.TIM_CR1] |= 1<<TIM_CR1_OPM
  # disable OPM
  stm.mem16[stm.TIM2 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask
  # disable OPM
  stm.mem16[stm.TIM5 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask
  stm.mem16[stm.TIM4 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask
  
  rep_counter_overflow_detector.longer_counter = rep_counter_overflow_detector._longer_counter
  print('trace')
  stm.mem16[stm.TIM1 + stm.TIM_SR] = (stm.mem16[stm.TIM1 + stm.TIM_SR] & 0b111<<13) # clear all flags
  pyb.enable_irq()
  print('pulsing')
  # enable OPM
  #reset_vals()
  adc.read_timed(adc_vals)
  #stm.mem16[stm.TIM4 + stm.TIM_CR1] |= 1 # CEN -- start ADC callback
  if rep_counter_overflow_detector.longer_counter==1:
    stm.mem16[tim_kickoff + stm.TIM_CR1] |= 1
    stm.mem16[stm.TIM1 + stm.TIM_RCR] = rep_counter_overflow_detector.or_in_end
  else:
    stm.mem16[tim_kickoff + stm.TIM_CR1] |= 1
  adc.read_timed_stop()
  print('done')

def timers_init():
  a(44,20,0)
  pulse()

# increase the TIM1 Update Interrupt priority, by lowering it's number all the way to 1
# stm.mem8[0xe000e400+25]=1<<4

dump_nvic()



YEL_LED.value(1)
EN_18V_ONBOARD.value(1)
pyb.delay(900)

YEL_LED.value(0)
EN_18V_ONBOARD.value(0)
YEL_LED.value(0)
pyb.delay(2900)
EN_18V_ONBOARD.value(1)
YEL_LED.value(1)
pyb.delay(200)




nvic_set_prio(-1, 1)
nvic_set_prio(25, 0)

# make sure PA0 PA1, PA2 are output LO state
# timers_init() 
#  2018-7-16-jg

# probably want to enable-preload (ARR, CCR1, etc), then load next set of values, then CEN
# because after n-pulses, UEV fires...
# then in a UEV interrupt (??) we can load the next set of values via DMA/memory, and re-CEN (unless there are no more data from DMA/memory)

#import dump_regs
#dump_regs.dump_regs()
