# boot.py -- run on boot-up
# can run arbitrary Python, but best to keep it minimal

import machine
import pyb
pyb.freq(96000000)
pyb.main('hv_pulser.py')  # main script to run after this one
# pyb.usb_mode('CDC+MSC')  # act as a serial and a storage device
# pyb.usb_mode('CDC+HID')  # act as a serial device and a mouse
