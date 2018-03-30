#!/bin/bash
# program_stlink_STM32F401CE.sh

openocd   -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program ./g30th_firmware0.bin 0x08000000 verify; program ./g30th_firmware1.bin 0x08020000 verify reset exit"
