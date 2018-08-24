#!/bin/bash
# netlist_pyflex_f401_asbuilt_net.sh
lepton-netlist -g PCB pyflex_f401_asbuilt.sch pyflex_f401_power_asbuilt.sch -o pyflex_f401_all_asbuilt.net
lepton-netlist -g partslist3 pyflex_f401_asbuilt.sch pyflex_f401_power_asbuilt.sch -o pyflex_f401_all_asbuilt.bom.tsv
echo " netlist_pyflex_f401_asbuilt_net.sh  -->     pyflex_f401_all_asbuilt.net --> libreoffice pyflex_f401_all_asbuilt.bom.tsv  "
