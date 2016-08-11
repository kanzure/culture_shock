# hv_pulser.py

import pyb
from pyb import Timer
import micropython
import stm

micropython.alloc_emergency_exception_buf(100)

# Use with pyb.freq(96000000) and prescaler=11 for .125 usec timer ticks.
xfmr_pulse_period = 9800   # (x usec * 8)
xfmr_pulse_w = 900          # (x usec * 8)
xfmr_pulse_pos_half_cycle = 1  # initial value -- changes every half cycle

# to give .125 usec timer ticks counting up:
t2 = pyb.Timer(2, prescaler=11, period=xfmr_pulse_period, mode=Timer.UP)

# xfmr_pulse_half_cycle timing.     (for rollover callback)
# JP27 output and interrrupt.  Compare generates interrupt:
t2ch3 = t2.channel(3, pyb.Timer.OC_TOGGLE, compare=xfmr_pulse_period,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP27)

# Define pins so they can be set with debug_pin.value() on the fly.
debug_pin = pyb.Pin('JP12', pyb.Pin.OUT_PP)         # working!


# NOT(xfmr_pulse_pos_half_cycle) driver pin.  (negative driving transistor)
# Compare turns on output pin at xfmr_pulse_w count:
t2ch1 = t2.channel(1, pyb.Timer.OC_INACTIVE, compare=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP25)

# xfmr_pulse_pos_half_cycle driver pin.  (positive driving transistor)
# Compare turns on output pin at xfmr_pulse_w count:
t2ch2 = t2.channel(2, pyb.Timer.OC_INACTIVE, compare=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP26)
# For t2ch2 CCMR1 reg OC2M output to HIGH --JP26
ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
ccmr1 &= 0b1101111111111111
ccmr1 |= 0b0101000000000000
stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1


def t2ch3_pulses_start_cb(t2ch3):
    "start pulse rising edge"
    global xfmr_pulse_pos_half_cycle
    if xfmr_pulse_pos_half_cycle == 1:  # pos half_cycle off-time end
        xfmr_pulse_pos_half_cycle = 0
        # turn on driver for following negative half_cycle
        # For t2ch1 CCMR1 reg OC2M output to HIGH -- JP25
        ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
        ccmr1 &= 0b1101111111111111
        ccmr1 |= 0b0101000000000000
        stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
        debug_pin.value(0)
    else:
        # 				neg half_cycle off-time end
        xfmr_pulse_pos_half_cycle = 1  # ready for pos pulse
        # turn on driver for following positive neg half_cycle
        # For t2ch2 CCMR1 reg OC2M output to HIGH --JP26
        ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
        ccmr1 &= 0b1101111111111111
        ccmr1 |= 0b0101000000000000
        stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
        debug_pin.value(1)


t2ch3.callback(t2ch3_pulses_start_cb)


# while True:
#     pyb.delay(5000)
#     debug_pin.value(0)
#     pyb.delay(5000)
#     debug_pin.value(1)
