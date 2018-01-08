#!/bin/bash

# update_clearances.awk.sh


filenames=$@
for myfile in $filenames
do

MYFILE=$myfile
echo "input file = "  $myfile
FILEBASENAME=${myfile%.*}

awk -f  ./update_clearances.awk ${FILEBASENAME}.lht > ${FILEBASENAME}.new.lht

done
