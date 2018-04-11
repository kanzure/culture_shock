# boot.py -- run on boot-up 
import machine
import pyb
pyb.usb_mode(None)
uart = pyb.UART(2, 9600)
uart.write(b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA'b'\xAA')
#pyb.repl_uart(uart)
pyb.freq(84000000)
pyb.main('pintest.py')
