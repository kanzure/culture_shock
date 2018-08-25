#!/bin/bash
# gnetlist_pyflex_f401_net.sh
gnetlist  -g PCB pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.net
gnetlist  -g partslist3 pyflex_f401.sch pyflex_f401_power.sch -o pyflex_f401_all.bom.tsv
echo "gnetlist_pyflex_f401_net.sh  -->     pyflex_f401_all.net --> libreoffice pyflex_f401_all.bom.tsv  "
