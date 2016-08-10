import pyb
from pyb import Timer
xfmr_pulse_period = 35 * 8   # (xx usec * 8)
xfmr_pulse_w = 1 * 8         # (xx usec * 8)

# timer 4 will be created
# Use with pyb.freq(96000000) and prescaler=11 for .125 usec timer ticks
tim = pyb.Timer(4, prescaler=11, period=xfmr_pulse_period)
tchannel = tim.channel(3, Timer.PWM, pin=pyb.Pin.board.JP32, pulse_width=27)

while True:
    pyb.delay(900)
    tchannel.pulse_width_percent(90)
    pyb.delay(900)
    tchannel.pulse_width(xfmr_pulse_w)
