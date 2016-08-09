# hv_pulser.py
import pyb
from pyb import Timer
import micropython
import stm

micropython.alloc_emergency_exception_buf(100)

# Use with pyb.freq(96000000) and prescaler=11 for .125 usec timer ticks.
xfmr_pulse_period = 0x1F40   # (1000 usec * 8)-> hex
xfmr_pulse_w = 0xa0          # (20 usec * 8)-> hex
xfmr_pulse_pos_half_cycle = 1

# to give .125 usec timer ticks counting up:
t1 = pyb.Timer(1, prescaler=11, period=xfmr_pulse_period, mode=Timer.UP)

# xfmr_pulse_half_cycle timing.     (for rollover callback)
# JP3 output and interrrupt.  Compare generates interrupt:
t1ch2 = t1.channel(2, pyb.Timer.OC_TOGGLE, compare=xfmr_pulse_period,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP3)   # working!

# Define pins so they can be set with pinx.value()on the fly.
debug_pin = pyb.Pin('JP6', pyb.Pin.OUT_PP)


# NOT(xfmr_pulse_pos_half_cycle) driver pin.  (negative driving transistor)
# Compare turns off output pin at xfmr_pulse_w count:
t1ch1 = t1.channel(1, pyb.Timer.OC_INACTIVE, compare=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP5)

# xfmr_pulse_pos_half_cycle driver pin.  (positive driving transistor)
# Compare turns off output pin at xfmr_pulse_w count:
t1ch3 = t1.channel(3, pyb.Timer.OC_INACTIVE, compare=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP4)


def t1ch2_pulses_start_cb():
    "start pulse rising edge"
    global xfmr_pulse_pos_half_cycle
    if xfmr_pulse_pos_half_cycle == 1:
        # xfmr_pulse positive half_cycle off-time just ended
        # turn on driver for following negative half_cycle
        xfmr_pulse_pos_half_cycle = 0
        # For ch1 CCMR1 register OC output to HIGH
        ccmr1 = stm.mem16[stm.TIM1 + stm.TIM_CCMR1]
        ccmr1 &= 0b1111111111011111
        ccmr1 |= 0b0000000001010000
        stm.mem16[stm.TIM1 + stm.TIM_CCMR1] = ccmr1
    else:
        # xfmr_pulse negative half_cycle off-time just ended
        # turn on driver for following positive xfmr_pulse_pos_half_cycle = 1
        xfmr_pulse_pos_half_cycle = 1
        # For ch3 CCMR3 register OC output to HIGH
        ccmr3 = stm.mem16[stm.TIM1 + stm.TIM_CCMR3]
        ccmr3 &= 0b1111111111011111
        ccmr3 |= 0b0000000001010000
        stm.mem16[stm.TIM1 + stm.TIM_CCMR3] = ccmr3


t1ch2.callback(t1ch2_pulses_start_cb)


while True:
    pyb.delay(1)
    debug_pin.value(0)
    pyb.delay(1)
    debug_pin.value(1)
