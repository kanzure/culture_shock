# boot.py -- run on boot-up
import machine
import pyb
pyb.usb_mode('VCP') # act as a serial and not as a storage device
pyb.main('pulser_main.py')
