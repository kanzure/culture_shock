# boot.py -- run on boot-up
# can run arbitrary Python, but best to keep it minimal

import pyb
pyb.usb_mode('VCP')
pyb.main('tim3_enable_tim1_1_tim2_3_tim5_2__tim1_shuts_down.py')
