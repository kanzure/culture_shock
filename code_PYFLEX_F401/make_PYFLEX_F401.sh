#!/bin/bash

export BOARD="PYFLEX_F401"
echo Building for $BOARD


export FROZEN_DIR="/home/john/Documents/EEProjects/circuitboards/culture_shock/code_PYFLEX_F401/modules"
FROZEN_MPY_DIR=$FROZEN_DIR

if [ $BOARD ]
then
    cd /home/john/micropython/ports/stm32
    if [ "$1" == "--clean" ]
    then
        make BOARD=$BOARD clean
        exit
    fi
    if make -j 2 V=1 BOARD=$BOARD
    then
        sleep 1
       make V=1 BOARD=$BOARD deploy-openocd
        cd -
       sleep 1
       rshell
    else
        echo Build failure
    fi
else
    echo "Wrong board type."
fi
