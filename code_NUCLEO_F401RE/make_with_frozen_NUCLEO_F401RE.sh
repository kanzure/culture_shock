#!/bin/bash
# make_with_frozen_NUCLEO_F401RE.sh

export BOARD="NUCLEO_F401RE"
echo Building for $BOARD

export FROZEN_DIR="/home/john/Documents/EEProjects/circuitboards/culture_shock/code_NUCLEO_F401RE/frozen"

if [ $BOARD ]
then
    cd /home/john/micropython/ports/stm32
    if [ "$1" == "--clean" ]
    then
        make BOARD=$BOARD clean
        exit
    fi
    if make -j 2 BOARD=$BOARD FROZEN_MPY_DIR=$FROZEN_DIR
    then
        sleep 1
        make BOARD=$BOARD deploy-stlink
        cd -
#        sleep 1
#        rshell
    else
        echo Build failure
    fi
else
    echo "Wrong board type."
fi
