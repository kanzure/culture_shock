#!/bin/bash
# update_clearances.sh

filenames=$@
for myfile in $filenames
do

echo "input file = "  $myfile
FILEBASENAME=${myfile%.*}
echo "FILEBASENAME= " $FILEBASENAME

echo '
SaveTo(LayoutAs, ' ${FILEBASENAME}.out.lht ', "lihata board v4")
' | pcb-rnd  --gui batch $myfile


done
