##### define some env variables:
###### The directory where micropython and culture_shock repos are cloned on your computer is "xxxx", You fill in the x's.)
###### give them a question prompt if there is no env var yet on their computer.)
set env var "UPYTHON_HOME" = "xxxxx"  

set env var "BOARD" = "PYFLEX_F401"  
print "Building for:  ", os.environ["BOARD"]

##### Running the build script:
   * git clone https://github.com/micropython/micropython.git
   * cd $UPYTHON_HOME/micropython
   * git checkout commit 68f4cba3d2aa056f305a20c9e394d4ebf81869ce 
   * *patch with ADC DMA sampling changes*
       o patch -p1 ./ports/stm32/adc.c < ../culture_shock/FOR_ADC_DMA__adc.c.patch
           + assumes culture_shock and micropython repos are in the same directory
           + hacks the*read_timed*method, and adds a new method*read_timed_stop*
   * cd ports/stm32/boards/
   * git clone https://github.com/jgriessen/PYFLEX_F401.git   (conditional on existence)
   * cd ..
   * prompt user to:  press SW23 -- boot0 switch, and hold down, press/release SW22 -- reset switch.
######  make refers to micropython/ports/stm32/Makefile.
   * make BOARD=PYFLEX_F401

##### if you need to erase the program area, i.e. if you wrote bad MicroPython code that "bricked" the MCU
##### (Starting from the same directory as above -- micropython/ports/stm32)
```
dfu-util -v -s :mass-erase:force -a 0 -d 0483:df11 -D build-G30TH/firmware.dfu
```
   * make BOARD=G30TH deploy 		
