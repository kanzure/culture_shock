import pyb
from pyb import Timer
xfmr_pulse_period = 0x120   # (xx00 usec * 8) -> hex

# timer 4 will be created with a frequency of xxx kHz
tim = pyb.Timer(4, prescaler=11, period=200)
tchannel = tim.channel(3, Timer.PWM, pin=pyb.Pin.board.JP32, pulse_width=27)

while True:
    pyb.delay(90)
    tchannel.pulse_width_percent(90)
    pyb.delay(90)
    tchannel.pulse_width_percent(1)
