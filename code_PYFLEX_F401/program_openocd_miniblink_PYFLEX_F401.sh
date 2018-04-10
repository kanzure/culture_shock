#!/bin/bash
# program_openocd_miniblink_PYFLEX_F401.sh

openocd   -f ./minimodule-swd-on-ch1.cfg  -f target/stm32f4x.cfg -c "program pyflex_f401.elf  verify reset exit"
