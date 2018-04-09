import pyb
from pyb import Timer
import micropython
import stm

micropython.alloc_emergency_exception_buf(100)

# Use with pyb.freq(84000000) and prescaler=20 for .25 usec timer ticks.
xfmr_pulse_period = 14000000   # = (usec * 4)   700ms
xfmr_pulse_w = 900000          # = (usec * 4)  225ms
pos_pulse_total = 0
pos_pulse_burstlen = 50007
neg_pulse_total = 0
neg_pulse_burstlen = 50007

# Timer 2 to give .25 usec timer ticks counting up:
t2 = pyb.Timer(2, prescaler=20, period=xfmr_pulse_period, mode=Timer.UP)

# xfmr pulse half_cycle timing.     (OC rollover callback)
# output and interrrupt.  Compare generates interrupt:
t2ch3 = t2.channel(3, pyb.Timer.OC_TOGGLE, compare=xfmr_pulse_period,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.LED_GREEN)
t2ch2 = t2.channel(2, pyb.Timer.OC_TOGGLE, compare=xfmr_pulse_period,
                   polarity=pyb.Timer.HIGH, pin=pyb.Pin.board.LED_YELLOW)

# Define already set up pins so they can be read with a pin reference like:  pin8.value() on the fly.
pin8 = pyb.Pin.board.LED_GREEN
pin9 = pyb.Pin.board.LED_YELLOW
# Define pins so they can be set with a pin reference like:  pin10.value(1) on the fly.
pinB0 = pyb.Pin('PB0', pyb.Pin.OUT_PP)
pinB1 = pyb.Pin('PB1', pyb.Pin.OUT_PP)
pinB2 = pyb.Pin('PB2', pyb.Pin.OUT_PP)

for i in range(30):
    pinB1.value(1)  
    time.sleep(1.0)
    pinB1.value(0)
    pinB0.value(1)
    time.sleep(1.0)
    pinB0.value(0)
    pinB2.value(1)
    time.sleep(1.0)
    pinB2.value(0)
