# boot.py -- run on boot-up

import machine
import pyb
pyb.freq(84000000)
pyb.main('pintest.py')
