# pintest.py
import machine
import pyb
# USB not used for repl
# pyb.usb_mode(None)
uart = pyb.UART(2, 9600)
pyb.repl_uart(uart)

# Define pins so they can be set with a pin reference like:  pin10.value(1) on the fly.
pinA5 = machine.Pin(machine.Pin.cpu.A5, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB3 = machine.Pin(machine.Pin.cpu.B3, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB4 = machine.Pin(machine.Pin.cpu.B4, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB5 = machine.Pin(machine.Pin.cpu.B5, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB6 = machine.Pin(machine.Pin.cpu.B6, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB7 = machine.Pin(machine.Pin.cpu.B7, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB8 = machine.Pin(machine.Pin.cpu.B8, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB9 = machine.Pin(machine.Pin.cpu.B9, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB10 = machine.Pin(machine.Pin.cpu.B10, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB13 = machine.Pin(machine.Pin.cpu.B13, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB14 = machine.Pin(machine.Pin.cpu.B14, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)
pinB15 = machine.Pin(machine.Pin.cpu.B15, machine.Pin.OUT_PP, machine.Pin.PULL_NONE)

count = 0
while ( count < 9):
#    pinA5.value(1)
    pinB5.value(1)
    pinB6.value(1)
    pinB7.value(1)
#    pinB3.value(1)
#    pinB4.value(0)
    pinB8.value(1)
    pinB9.value(1)
    pyb.delay(1200)
#    pinA5.value(0)
    pinB5.value(0)
    pinB6.value(0)
    pinB7.value(0)
#    pinB3.value(0)
#    pinB4.value(0)
    pinB8.value(0)
    pinB9.value(0)
    pyb.delay(1200)
    count = count + 1
