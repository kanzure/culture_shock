First, before starting, the MCU board must have micropython loaded -- see other docs 
such as micropython_compile_G30TH.txt, micropython_coding_with_rshell.txt about that.

To run code on a culture shock board, (with STM32F401 inside), several files are needed.

As this code is written so far, it needs these files loaded to the flash filesystem of the 
micropython running MCU:

tim3_enable_tim1_tim2_tim5__tim1_shuts_down.py
stm_low_level.py
nvic.py
boot.py

After loading those files and resetting the MCU board, the tim3_enable_tim1_tim2_tim5__tim1_shuts_down.py
program will run.



For a serial prompt:
 - Windows: you need to go to 'Device manager', right click on the unknown device,
   then update the driver software, using the 'pybcdc.inf' file found on this drive.
   Then use a terminal program like Hyperterminal or putty.
 - Mac OS X: use the command: screen /dev/tty.usbmodem*
 - Linux: use the command: screen /dev/ttyACM0

Please visit http://micropython.org/help/ for further help.
