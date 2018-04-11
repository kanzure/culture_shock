import pyb
from pyb import Timer
import micropython

# Define pins so they can be set with a pin reference like:  pin10.value(1) on the fly.
pinA5 = pyb.Pin('PA5', pyb.Pin.OUT_PP)
pinB0 = pyb.Pin('PB0', pyb.Pin.OUT_PP)
pinB1 = pyb.Pin('PB1', pyb.Pin.OUT_PP)
pinB2 = pyb.Pin('PB2', pyb.Pin.OUT_PP)
pinB3 = pyb.Pin('PB3', pyb.Pin.OUT_PP)
pinB4 = pyb.Pin('PB4', pyb.Pin.OUT_PP)
pinB5 = pyb.Pin('PB5', pyb.Pin.OUT_PP)
pinB6 = pyb.Pin('PB6', pyb.Pin.OUT_PP)
pinB7 = pyb.Pin('PB7', pyb.Pin.OUT_PP)
pinB10 = pyb.Pin('PB10', pyb.Pin.OUT_PP)
pinB13 = pyb.Pin('PB13', pyb.Pin.OUT_PP)
pinB14 = pyb.Pin('PB14', pyb.Pin.OUT_PP)
pinB15 = pyb.Pin('PB15', pyb.Pin.OUT_PP)


pinA5.value(1)
pinB5.value(0)
while True:
    pinA5.toggle()
    pinB5.toggle()
    pinB0.toggle()
    pinB1.toggle()
    pinB2.toggle()
    pyb.delay(200)
