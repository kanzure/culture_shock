#!/bin/bash
# program_openocd_ft2232h_PYFLEX_F401.sh

openocd   -f /home/john/Documents/EEProjects/circuitboards/culture_shock/code_PYFLEX_F401/minimodule-swd-on-ch1.cfg  -f target/stm32f4x.cfg -c "program ./PYFLEX_F401_firmware0.bin 0x08000000 verify; program ./PYFLEX_F401_firmware1.bin 0x08020000 verify reset exit"
