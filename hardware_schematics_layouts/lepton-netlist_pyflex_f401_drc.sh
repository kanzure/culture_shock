#!/bin/bash
# lepton-netlist_pyflex_f401_drc.sh
lepton-netlist  -g drc2 pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.drc
lepton-netlist -g partslist3 pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.bom.tsv
echo " lepton-netlist_pyflex_f401_drc.sh  -->    pyflex_f401_all.drc"
