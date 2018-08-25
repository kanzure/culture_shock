#!/bin/bash
# gnetlist_pyflex_f401_asbuilt_net.sh
gnetlist -g PCB pyflex_f401_asbuilt.sch pyflex_f401_power_asbuilt.sch -o pyflex_f401_asbuilt_all.net
gnetlist -g partslist3 pyflex_f401_asbuilt.sch pyflex_f401_power_asbuilt.sch -o pyflex_f401_asbuilt_all.bom.tsv
echo " gnetlist_pyflex_f401_asbuilt_net.sh  -->     pyflex_f401_all_asbuilt.net --> libreoffice pyflex_f401_asbuilt_all.bom.tsv  "
