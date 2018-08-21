#!/bin/bash
# lepton-netlist_pyflex_f401_net.sh
lepton-netlist -g PCB pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.net
lepton-netlist -g partslist3 pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.bom.tsv
echo " lepton-netlist_pyflex_f401_net.sh  -->     pyflex_f401_all.net --> libreoffice pyflex_f401_all.bom.tsv  "
