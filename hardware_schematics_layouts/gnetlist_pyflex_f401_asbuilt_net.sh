#!/bin/bash
# gnetlist_pyflex_f401_asbuilt_net.sh
gnetlist -g PCB pyflex_f401_asbuilt.sch pyflex_f401_boost_asbuilt.sch -o pyflex_f401_all_asbuilt.net
gnetlist -g partslist3 pyflex_f401_asbuilt.sch pyflex_f401_boost_asbuilt.sch -o pyflex_f401_all_asbuilt.bom.tsv
echo " gnetlist_pyflex_f401_asbuilt_net.sh  -->     pyflex_f401_all_asbuilt.net --> libreoffice pyflex_f401_all_asbuilt.bom.tsv  "
