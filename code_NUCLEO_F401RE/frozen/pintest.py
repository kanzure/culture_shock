import pyb
from pyb import Timer
import micropython
import stm

micropython.alloc_emergency_exception_buf(100)

# Use with pyb.freq(84000000) and prescaler=20 for .25 usec timer ticks.
xfmr_pulse_period = 4000000   # = (usec * 4)   700ms
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
pinB10 = pyb.Pin('PB10', pyb.Pin.OUT_PP)
pinB13 = pyb.Pin('PB13', pyb.Pin.OUT_PP)
pinB14 = pyb.Pin('PB14', pyb.Pin.OUT_PP)
pinB15 = pyb.Pin('PB15', pyb.Pin.OUT_PP)

for i in range(30):
    pinB10.value(1)  
    time.sleep(1.0)
    pinB10.value(0)
    pinB13.value(1)
    time.sleep(1.0)
    pinB13.value(0)
    pinB14.value(1)
    time.sleep(1.0)
    pinB14.value(0)
    pinB15.value(1)
    time.sleep(1.0)
    pinB15.value(0)
    pinB3.value(1)
    time.sleep(1.0)
    pinB3.value(0)
    pinB4.value(1)
    time.sleep(1.0)
    pinB4.value(0)
    pinB5.value(1)
    time.sleep(1.0)
    pinB5.value(0)
    pinB6.value(1)
    time.sleep(1.0)
    pinB6.value(0)
    pinB7.value(1)
    time.sleep(1.0)
    pinB7.value(0)
