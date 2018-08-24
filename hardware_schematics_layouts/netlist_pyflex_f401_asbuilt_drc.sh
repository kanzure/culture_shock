#!/bin/bash
# gnetlist_pyflex_f401_asbuilt_drc.sh
lepton-netlist -g drc2 pyflex_f401_asbuilt.sch pyflex_f401_power_asbuilt.sch   -o pyflex_f401_all_asbuilt.drc
lepton-netlist -g partslist3 pyflex_f401_asbuilt.sch pyflex_f401_power_asbuilt.sch   -o pyflex_f401_all_asbuilt.bom.tsv
echo " netlist_pyflex_f401_all_asbuilt_drc.sh   -->    pyflex_f401__asbuilt.drc"
