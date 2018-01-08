#!/bin/bash
# update_clearances_action-cmds.sh

filenames=$@
for myfile in $filenames
do
echo "input file = "  $myfile
FILEBASENAME=${myfile%%.*}
echo "FILEBASENAME= " $FILEBASENAME

echo '
query(select, "(@.type == POLYGON) && (@.layer.type == COPPER)")
query(select, "(@.type == ARC) && (@.layer.type == COPPER)")
query(select, "(@.type == LINE) && (@.layer.type == COPPER)")
ChangeSize(SelectedObjects, 0.3, mm )
SaveTo(LayoutAs, ' ${FILEBASENAME}.new.lht ', "lihata board v4")
' | pcb-rnd  --gui batch $FILEBASENAME.lht

done
