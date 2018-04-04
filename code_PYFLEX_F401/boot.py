# boot.py -- run on boot-up

import machine
import pyb
pyb.freq(84000000)
pyb.main('tim3_enable_tim1_tim2_tim5__tim1_shuts_down.py')
