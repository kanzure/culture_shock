#!/bin/bash
# program_openocd_ft2232h_G30FLEX.sh

openocd   -f /home/john/Documents/EEProjects/circuitboards/culture_shock/code_PYFLEX_F401/minimodule-swd-on-ch1.cfg  -f target/stm32f4x.cfg -c "program /home/john/micropython/ports/stm32/build-G30FLEX/firmware0.bin 0x08000000 verify; program /home/john/micropython/ports/stm32/build-G30FLEX/firmware1.bin 0x08020000 verify reset exit"
