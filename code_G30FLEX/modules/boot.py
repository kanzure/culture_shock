# boot.py -- run on boot-up
# can run arbitrary Python, but best to keep it minimal

import pyb
pyb.usb_mode('VCP+MSC')
pyb.main('main.py')
