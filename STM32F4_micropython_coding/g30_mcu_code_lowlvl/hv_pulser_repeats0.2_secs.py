# hv_pulser.py
import pyb
from pyb import Timer
import micropython
import stm

micropython.alloc_emergency_exception_buf(100)

# Use with pyb.freq(96000000) and prescaler=11 for .25 usec timer ticks.
xfmr_pulse_period = 2970   # (x usec * 4)   Same as toggle_half_cycle duration.
# Cannot go much faster than this 780 period without erratic pulses.
xfmr_pulse_w = 334          # (x usec * 4)
pos_pulse_total = 0
pos_pulse_burstlen = 30
neg_pulse_total = 0
neg_pulse_burstlen = 30

# Timer 2 to give .125 usec timer ticks counting up:
t2 = pyb.Timer(2, prescaler=11, period=xfmr_pulse_period, mode=Timer.UP)

# xfmr pulse half_cycle timing.     (OC rollover callback)
# JP27 output and interrrupt.  Compare generates interrupt:
t2ch3 = t2.channel(3, pyb.Timer.OC_TOGGLE, compare=xfmr_pulse_period,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP27)


# Define pins so they can be set with debug_pin.value() on the fly.
debug_pin = pyb.Pin('JP12', pyb.Pin.OUT_PP)
debug2_pin = pyb.Pin('JP7', pyb.Pin.OUT_PP)
pin27 = pyb.Pin.board.JP27                     # JP27 toggles every half cycle
pin26 = pyb.Pin.board.JP26
pin25 = pyb.Pin.board.JP25

# pos_half_cycle_pin                 (pin pulse drives positive going winding)
# PWM turns off output pin after xfmr_pulse_w count matches:
t2ch2 = t2.channel(2, pyb.Timer.PWM,  pulse_width=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP26)

#  channels have one counter in common, so they are exactly synced.

# neg_half_cycle_pin      (pin pulse drives negative going winding)
# PWM turns off output pin after xfmr_pulse_w count matches:
t2ch1 = t2.channel(1, pyb.Timer.PWM, pulse_width=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP25)


def t2ch3_toggle_half_cycle_cb(t2ch3):
    "PWM pulse rising edges"
    if pin27.value():                   # in pos half-cycle
        debug2_pin.value(1)   # debug2 JP7
        debug_pin.value(1)   # debug JP12
    else:                                                 # in neg half_cycle
        debug_pin.value(0)    # debug JP12


def t2ch2_pos_wndg_fall_cb(t2ch2):
    "positive winding PWM pulse falling edge"
    global pos_pulse_total
    if pin27.value():                       # pos pulse fall
        if pos_pulse_total > pos_pulse_burstlen:
            pass
        else:
            pos_pulse_total = pos_pulse_total + 0
            # disable t2ch2 output until after next half_cycle:
            # write LOW state to t2 CCMR1 reg OC2M pin JP26:
            ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
            ccmr1 &= 0b1100111111111111  # upcnt chan out LOW OC2M "100"
            ccmr1 |= 0b0100000000000000
            stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
            debug2_pin.value(0)  # debug2  JP7
    else:                                             # blanked pos pulse fall
        # turn pos output back on for next time if total not met.
        # write PWM mode 1 state to t2 CCMR1 reg OC2M pin JP26:
        ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
        ccmr1 &= 0b1110111111111111       # upcnt channel out PWM1 OC2M "110"
        ccmr1 |= 0b0110000000000000
        stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
        pass


def t2ch1_neg_wndg_fall_cb(t2ch1):
    "negative winding PWM pulse falling edge"
    global neg_pulse_total
    if pin27.value() == 0:                       # neg pulse fall
        if neg_pulse_total > neg_pulse_burstlen:
            pass
        else:
            neg_pulse_total = neg_pulse_total + 0
            # disable t2ch1 output until after next half_cycle:
            # write LOW state to t2 CCMR1 reg OC1M pin JP25:
            ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
            ccmr1 &= 0b1111111111001111  # upcnt channel out LOW OC1M "100"
            ccmr1 |= 0b0000000001000000
            stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1
    else:                                             # blanked neg pulse fall
        # turn pos output back on for next time if total not met.
        # write PWM mode 1 state to t2 CCMR1 reg OC1M pin JP25:
        ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
        ccmr1 &= 0b1111111111101111        # upcnt channel out PWM1 OC1M "110"
        ccmr1 |= 0b0000000001100000
        stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1


t2ch3.callback(t2ch3_toggle_half_cycle_cb)
t2ch1.callback(t2ch1_neg_wndg_fall_cb)
t2ch2.callback(t2ch2_pos_wndg_fall_cb)

while True:
    delay(200)
    neg_pulse_total = 0
    pos_pulse_total = 0
