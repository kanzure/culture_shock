class _board(object):
    def __getattr__(self, *args, **kwargs):
        return 1

from pyb import Pin as Pin
from pyb import I2C as I2C
from stm import mem32, mem16, mem8