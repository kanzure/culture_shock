# hv_pulser.py
import pyb
from pyb import Timer
import micropython
import stm

micropython.alloc_emergency_exception_buf(100)

# Use with pyb.freq(96000000) and prescaler=11 for .25 usec timer ticks.

xfmr_pulse_period = 370  # (= usec * 4)   Same as toggle_half_cycle duration.
xfmr_pulse_w = 84                              # (= usec * 4)
push_puls_cnt = 0
pulse_burstlen = 3
pull_puls_cnt = 0
burst_period = 31399                            # (= usec * 4)    msec

# Timer 1 to repeat a burst every burst_period counting up:
t1 = pyb.Timer(1, prescaler=95, period=burst_period, mode=Timer.UP)

# Timer 2 to give .125 usec timer ticks counting up:
t2 = pyb.Timer(2, prescaler=11, period=xfmr_pulse_period, mode=Timer.UP)


# xfmr pulse half_cycle timing.     (OC rollover callback)
# JP27 output and interrrupt.  Compare generates interrupt:
t2ch3 = t2.channel(3, pyb.Timer.OC_TOGGLE, compare=xfmr_pulse_period,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP27)


# Define pins for taking values.
pin27 = pyb.Pin.board.JP27                     # JP27 toggles every half cycle
pin28 = pyb.Pin.board.JP28                     # JP28 toggles slowly.
# pin26 = pyb.Pin.board.JP26
# pin25 = pyb.Pin.board.JP25
# t2 channels have one counter in common, so they are exactly synced.


# push_half_cycle_pin                 (pin pulse drives push winding)
# PWM turns off output pin after xfmr_pulse_w count matches:
t2ch2 = t2.channel(2, pyb.Timer.PWM,  pulse_width=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP26)

# Put t2ch2  t2ch1 mode to FORCED_INACTIVE to start...
ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
ccmr1 &= 0b1100111111001111  # OC2M "100"....OC1M "100"
ccmr1 |= 0b0100000001000000
stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1

# pull_half_cycle_pin      (pin pulse drives pull winding)
# PWM turns off output pin after xfmr_pulse_w count matches:
t2ch1 = t2.channel(1, pyb.Timer.PWM, pulse_width=xfmr_pulse_w,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.JP25)

# Put t2ch2 t2ch1 mode to FORCED_INACTIVE to start...
ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]
ccmr1 &= 0b1100111111001111  # OC2M "100"....OC1M "100"
ccmr1 |= 0b0100000001000000
stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1

# Prepare for t2 channel setups without spurious unwanted partial pulses
t2.counter(xfmr_pulse_w - 2)  # t2 count so PWM1 mode is just before fall time.

t1ch1 = t1.channel(1, pyb.Timer.OC_TOGGLE,
                   compare=burst_period, pin=pyb.Pin.board.JP5)

push_puls_cnt = 0  # In case the above counter trigger affected these counts
pull_puls_cnt = 0


def t2ch2_push_wndg_fall_cb(t2ch2):
    "push winding PWM pulse falling edge interrupt"
    # Depends on if stmt compares all being done before action blocks
    # since action blocks increment counts.
    global push_puls_cnt
    global pull_puls_cnt
    is_push = pin27.value()
    #                       enable/disable next pulse based on 0 or 1 result
    #                              of pin27.value() taken once per interrupt.

    ccmr1 = stm.mem16[stm.TIM2 + stm.TIM_CCMR1]  # reg state before ifs:
    if is_push and (push_puls_cnt < pulse_burstlen):
        # t2ch2 push OC2M froz "000" JP26, t2ch1 pull OC1M PWM1 "110" JP25
        ccmr1 &= 0b1000111111101111  # OC2M "000"....OC1M "110"
        ccmr1 |= 0b0000000001100000
        push_puls_cnt = push_puls_cnt + 1
    elif not(is_push) and (pull_puls_cnt < pulse_burstlen):
        # t2ch2 push OC2M PWM1 "110" JP26, t2ch1 pull OC1M froz "000" JP25
        ccmr1 &= 0b1110111110001111       # OC2M "110"....OC1M "000"
        ccmr1 |= 0b0110000000000000
        pull_puls_cnt = pull_puls_cnt + 1
    elif (push_puls_cnt == pulse_burstlen) and (pull_puls_cnt < pulse_burstlen):
        # t2ch2 push OC2M froz "000" JP26, t2ch1 pull OC1M  "xxx" JP25
        ccmr1 &= 0b1000111111111111       # OC2M "000"....OC1M "xxx"
        ccmr1 |= 0b0000000000000000
    elif (pull_puls_cnt == pulse_burstlen) and (push_puls_cnt < pulse_burstlen):
        # t2ch2 push OC2M "xxx" JP26, t2ch1 pull OC1M  froz "000" JP25
        ccmr1 &= 0b1111111110001111       # OC2M "xxx"....OC1M "000"
        ccmr1 |= 0b0000000000000000
    elif (pull_puls_cnt >= pulse_burstlen) and (push_puls_cnt >= pulse_burstlen):
        # t2ch2 push OC2M INACT "100" JP26, t2ch1 pull OC1M  INACT "100" JP25
        ccmr1 &= 0b1100111111001111       # OC2M "100"....OC1M "100"
        ccmr1 |= 0b0100000001000000

    stm.mem16[stm.TIM2 + stm.TIM_CCMR1] = ccmr1  # save state after above ifs.

t2.counter(xfmr_pulse_w + 2)  # t2 count so PWM1 mode is just after fall time.

t2ch2.callback(t2ch2_push_wndg_fall_cb)

push_puls_cnt = 0  # In case counter trigger affected these counts
pull_puls_cnt = 0
