#!/bin/bash
# make_with_frozen_PYFLEX_F401.sh

echo Building for $BOARD

export FROZEN_DIR="/home/john/Documents/EEProjects/circuitboards/culture_shock/code_PYFLEX_F401/frozen"

if [ $BOARD ]
then
    cd /home/john/micropython/ports/stm32
    if  [ $1 = "--clean" ]
    then
        make BOARD=$BOARD clean
        exit
    fi
    if make -j 2 BOARD=$BOARD FROZEN_MPY_DIR=$FROZEN_DIR
    then
        sleep 1
        make BOARD=$BOARD deploy
        cd -
        sleep 1
        rshell
    else
        echo Build failure
    fi
else
    echo "Wrong board type."
fi
