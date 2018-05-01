#!/bin/bash
# freeze_mods_G30FLEX.sh

export BOARD="G30FLEX"
echo Building for $BOARD

export MODULES_DIR="/home/john/Documents/EEProjects/circuitboards/culture_shock/code_G30FLEX/modules" 

if [ $BOARD ]
then
    cd /home/john/micropython/ports/stm32
    if [ "$1" == "--clean" ]
    then
        make BOARD=$BOARD clean
        exit
    fi
    if make -j 2 V=1 BOARD=$BOARD FROZEN_MPY_DIR=$MODULES_DIR
    then
        sleep 1
#        make V=1 BOARD=$BOARD deploy-openocd
        cd -
#        sleep 1
#        rshell
    else
        echo Build failure
    fi
else
    echo "Wrong board type."
fi
