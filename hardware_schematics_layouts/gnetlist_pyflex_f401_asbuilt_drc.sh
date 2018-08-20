#!/bin/bash
# gnetlist_pyflex_f401_asbuilt_drc.sh
gnetlist -g drc2 pyflex_f401_all_asbuilt.sch pyflex_f401_boost_asbuilt.sch   -o pyflex_f401_all_asbuilt.drc
gnetlist -g partslist3 pyflex_f401_all_asbuilt.sch pyflex_f401_boost_asbuilt.sch   -o pyflex_f401_all_asbuilt.bom.tsv
echo " gnetlist_pyflex_f401_all_asbuilt_drc.sh   -->    pyflex_f401_all_asbuilt.drc"
