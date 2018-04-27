#!/bin/bash
# program_openocd_stlink_STM32F401CE.sh

openocd   -f /home/john/Documents/EEProjects/circuitboards/culture_shock/code_PYFLEX_F401/minimodule-swd-on-ch1.cfg  -f target/stm32f4x.cfg -c "program ./pyflex_firmware.elf verify reset exit"
