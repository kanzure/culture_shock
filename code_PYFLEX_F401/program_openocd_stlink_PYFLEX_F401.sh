#!/bin/bash
# program_openocd_stlink_STM32F401CE.sh

openocd   -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program ./PYFLEX_F401_firmware0.bin 0x08000000 verify; program ./PYFLEX_F401_firmware1.bin 0x08020000 verify reset exit"
