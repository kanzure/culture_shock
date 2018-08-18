#!/bin/bash
# gnetlist_pyflex_f401_drc.sh
gnetlist -g drc2 pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.drc
gnetlist -g partslist3 pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.bom.tsv
echo " gnetlist_pyflex_f401_drc.sh  -->    pyflex_f401_all.drc"
