# Flashing MicroPython
## PYFLEX_F401
* `git clone https://github.com/micropython/micropython.git`
* ``export UPYTHON_HOME=`realpath micropython` ``
* `export BOARD=PYFLEX_F401`
* `cd $UPYTHON_HOME/micropython`
* `git checkout commit 68f4cba3d2aa056f305a20c9e394d4ebf81869ce`
* __patch with ADC DMA sampling changes__
  * `patch -p1 ./ports/stm32/adc.c < ../culture_shock/FOR_ADC_DMA__adc.c.patch`
    * assumes culture_shock and micropython repos are in the same directory
    * hacks the __read_timed__ method, and adds a new method __read_timed_stop__
* `cd ports/stm32/boards/`
* `git clone https://github.com/jgriessen/PYFLEX_F401.git`
  * if you don't already have it
* `cd ..`
* on PYFLEX board
  * press & hold    __SW23__ (boot0 switch)
  * press & release __SW22__ (reset switch)
* `make BOARD=PYFLEX_F401`
  * make refers to micropython/ports/stm32/Makefile.
* __if you need to erase the program area, i.e. if you wrote bad MicroPython code that "bricked" the MCU__
  * (Starting from the same directory as above -- micropython/ports/stm32)
  * `dfu-util -v -s :mass-erase:force -a 0 -d 0483:df11 -D build-G30TH/firmware.dfu`
* `make BOARD=PYFLEX_F401 deploy`
