# boot.py -- run on boot-up
# can run arbitrary Python, but best to keep it minimal

import machine
import pyb
pyb.main('tim3_enable_tim1_tim2_tim5__tim1_shuts_down.py')  # 6 ms full-length, period == 460 us, width == 196 us
