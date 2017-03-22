"""
Based on:
  example for:
  -- linked timers, slave in trigger mode, i.e. counter enabled from the master
  -- (slave) timer in one-pulse-mode with repetition
  https://community.st.com/thread/39151-one-pulse-with-repitition-counter
"""


import stm
from pyb import Timer
from machine import Pin
from stm_low_level import *
import micropython
micropython.alloc_emergency_exception_buf(100)

period = 3194 # 400# 10000
width = 684 # 10#1500
number_of_pulse_pairs = 6
common_prescaler = 11

p32_pin = Pin('JP32', Pin.OUT) # Pin('JP17', Pin.OUT)
p32_pin.value(0)


enable_gpio_and_timers()
enable_pa0_pa1_af()
counter = 0

#
# faster version of: pa1_extint.enable()
#stm.mem32[stm.EXTI + stm.EXTI_IMR] |= 1<<1  # enable MR1 (interrupt mask 1)
#stm.mem16[stm.TIM2 + stm.TIM_CR1] |= 1<<3
@micropython.native
def end_of_n_pulse_train_pa1_first(t):
  import stm
  #stm.mem16[stm.TIM5 + stm.TIM_CR1] &= (~1) & 0xFFFF# disable CEN
  #stm.mem16[stm.TIM2 + stm.TIM_CR1] &= (~1) & 0xFFFF# disable CEN
  stm.mem16[stm.TIM5 + stm.TIM_CR1] |= 0b1000 # enable OPM
  stm.mem16[stm.TIM2 + stm.TIM_CR1] |= 0b1000 # enable OPM
  #p32_pin.value(0)
  #stm.mem16[stm.TIM5 + stm.TIM_CR1] &= (~1) & two_byte_mask

@micropython.native
def end_of_n_pulse_train_less_than_289_period(t):
  import stm
  #stm.mem16[stm.TIM5 + stm.TIM_CR1] &= (~1) & 0xFFFF# disable CEN
  #stm.mem16[stm.TIM2 + stm.TIM_CR1] &= (~1) & 0xFFFF# disable CEN
  stm.mem16[stm.TIM5 + stm.TIM_CR1] |= 0b1000 # enable OPM
  stm.mem16[stm.TIM2 + stm.TIM_CR1] |= 0b1000 # enable OPM
  

t1 = pyb.Timer(1, prescaler=common_prescaler, period=0, callback=end_of_n_pulse_train_pa1_first)


connect_pa0_and_pa1_to_tim2_and_tim5()
enable_pb13_af_and_connect_to_tim1()

two_bits = 2

# as long as both TIM tick at AHB freq, the TIM's will tick at the same rate;
# should there be any APB divider impacting TIM input clock freq,
# this has to be factored in (individually per timer, as they are on different APBs)


def a(period, width, number_pulses=None):
  adjust_tim5(period, width)
  adjust_tim2(period, width)
  adjust_tim1(period, 1, number_pulses)



slave_tim = setup_slave_timer('TIM5', 2, 'TIM3', common_prescaler, period, width)
slave_tim = setup_slave_timer('TIM2', 1, 'TIM3', common_prescaler, period, width)
tim_kickoff = setup_n_pulse_kickoff_timer("TIM3", 1, common_prescaler, period, width)


# now setup TIM1 - we want it to disable itself i.e. one-pulse mode; 3 pulses, that goes to repetition counter - as the window is cca 600ms, let make them 50ms ON / 50ms OFF
stm.mem16[stm.TIM1 + stm.TIM_PSC] = 11
adjust_tim1(period=period, width=1, number_pulses=number_of_pulse_pairs)

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
stm.mem16[stm.TIM1 + stm.TIM_CR1]  &= ~(0b11<<5) & two_byte_mask
stm.mem16[stm.TIM1 + stm.TIM_CR1]  |= (0
   #| 0b11<<5  # center aligned
   | (1 << TIM_CR1_OPM)   # want one-time mode
  )

# force_inactive_tim5()
# force_inactive_tim2()
#stm.mem32[stm.TIM5 + stm.TIM_EGR] |= 1
#stm.mem32[stm.TIM2 + stm.TIM_EGR] |= 1
#
#tim5_set_pwm2()
#tim2_set_pwm2()
#stm.mem16[stm.EXTI + 0x00A4]=10


@micropython.native
def pulse():
  #stm.mem32[stm.TIM2 + stm.TIM_CNT] = 0
  # TODO: check these two have any effect, I thought they might prevent a pending GPIO toggle
  #stm.mem32[stm.TIM5 + stm.TIM_EGR] &= 0xff<<8 #|= 1
  #stm.mem32[stm.TIM2 + stm.TIM_EGR] &= 0xff<<8 #|= 1
  force_inactive_tim1()
  force_inactive_tim2()
  force_inactive_tim5()
  # TODO: is this needed? -- yes, it is... after you adjust the period/width,
  # otherwise you'll get a glitch for the first call to pulse()
  stm.mem32[stm.TIM5 + stm.TIM_EGR] |= 1
  stm.mem32[stm.TIM3 + stm.TIM_EGR] |= 1
  stm.mem32[stm.TIM2 + stm.TIM_EGR] |= 1

  stm.mem16[stm.TIM1 + stm.TIM_CNT] = 0#period 
  #stm.mem16[stm.TIM1 + stm.TIM_CNT] = (stm.mem32[stm.TIM1 + stm.TIM_ARR] // 2) + (2* get_tim5_width1())+2
  stm.mem16[stm.TIM1 + stm.TIM_CNT] = stm.mem32[stm.TIM1 + stm.TIM_ARR] # it seems TIM1 is running at double the freq TIM2/5
  stm.mem32[stm.TIM2 + stm.TIM_CNT] = 0#stm.mem32[stm.TIM2 + stm.TIM_ARR] //2
  stm.mem32[stm.TIM3 + stm.TIM_CNT] = 0
  stm.mem32[stm.TIM5 + stm.TIM_CNT] = stm.mem32[stm.TIM5 + stm.TIM_ARR] //2
  tim2_set_pwm2()
  tim5_set_pwm2()
  tim1_set_pwm2()
  
  stm.mem16[tim_kickoff + stm.TIM_CR1] |= 1<<TIM_CR1_OPM   # enable OPM
  stm.mem16[stm.TIM2 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask # disable OPM
  stm.mem16[stm.TIM5 + stm.TIM_CR1] &= (~(1<<TIM_CR1_OPM))&two_byte_mask # disable OPM
  #stm.mem32[stm.GPIOB + stm.GPIO_ODR] = four_byte_mask # faster (?) version of p32_pin.value(1)
  p32_pin.value(1)
  stm.mem16[tim_kickoff + stm.TIM_CR1] |= 1

# increase the TIM1 Update Interrupt priority, by lowering it's number all the way to 1
# stm.mem8[0xe000e400+25]=1<<4
from nvic import *
dump_nvic()
nvic_set_prio(-1, 1)
nvic_set_prio(25, 0)

# probably want to enable-preload (ARR, CCR1, etc), then load next set of values, then CEN
# because after n-pulses, UEV fires...
# then in a UEV interrupt (??) we can load the next set of values via DMA/memory, and re-CEN (unless there are no more data from DMA/memory)

#import dump_regs
#dump_regs.dump_regs()