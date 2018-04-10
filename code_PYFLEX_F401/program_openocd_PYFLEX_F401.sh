#!/bin/bash
# program_openocd_blinky_PYFLEX_F401.sh

openocd   -f /home/john/Documents/EEProjects/circuitboards/culture_shock/code_PYFLEX_F401/minimodule-swd-on-ch1.cfg  -f target/stm32f4x.cfg -c "program ./blinky.elf  verify reset exit"
