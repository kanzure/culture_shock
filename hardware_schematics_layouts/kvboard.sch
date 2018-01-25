v 20150930 2
N 58800 52100 59800 52100 4
{
T 59300 52200 5 10 1 1 0 0 1
netname=doubler_out
}
C 57900 51900 1 0 0 diode-1.sym
{
T 58300 52500 5 10 0 0 0 0 1
device=M20F
T 58500 52500 5 10 1 1 180 0 1
refdes=D4
T 58600 51800 5 10 1 1 180 0 1
value=2KV
T 57900 51900 5 10 0 0 0 0 1
description=diode rect 2000V 1A SMAF
T 57900 51900 5 10 0 0 0 0 1
footprint=DIOM_SMAFN.lht
}
C 59600 50900 1 270 0 capacitor-1.sym
{
T 60300 50700 5 10 0 0 270 0 1
device=472-3KV
T 59900 50600 5 10 1 1 0 0 1
refdes=C3
T 60500 50700 5 10 0 0 270 0 1
symversion=0.1
T 59300 50200 5 10 1 1 0 0 1
value=4.7nF
T 59600 50900 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat.fp
}
C 55600 51900 1 0 0 capacitor-1.sym
{
T 55800 52600 5 10 0 0 0 0 1
device=472-3KV
T 56100 52500 5 10 1 1 180 0 1
refdes=C1
T 55800 52800 5 10 0 0 0 0 1
symversion=0.1
T 56400 51800 5 10 1 1 180 0 1
value=4.7nF
T 55600 51900 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat.fp
}
N 56500 52100 57000 52100 4
{
T 56700 52100 5 10 1 1 0 0 1
netname=v2
}
N 56500 52100 56500 53000 4
N 56600 48900 56600 50100 4
N 59800 50900 59800 52100 4
C 55600 52800 1 0 0 capacitor-1.sym
{
T 55800 53500 5 10 0 0 0 0 1
device=472-3KV
T 56100 53400 5 10 1 1 180 0 1
refdes=C2
T 55800 53700 5 10 0 0 0 0 1
symversion=0.1
T 56400 52700 5 10 1 1 180 0 1
value=4.7nF
T 55600 52800 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat_flip.fp
}
N 57200 44700 59900 44700 4
N 59800 48900 59800 50000 4
N 59800 51800 63100 51800 4
N 55600 53000 55500 53000 4
N 55500 53000 55500 52100 4
C 37600 38200 0 0 0 title-A-cibolo.sym
{
T 58500 38200 5 10 1 1 0 0 1
file=kvboard.sch
T 62600 37900 5 10 1 1 0 0 1
drawn-by=John Griessen
T 50900 38000 5 18 1 1 0 0 1
title=Culture Shock kvboard PCB
T 58700 37900 5 10 1 1 0 0 1
first-pagenum=1
T 59400 37900 5 10 1 1 0 0 1
last-pagenum=1
T 62600 38200 5 10 1 1 0 0 1
rev=2018-01-17 v0.4
T 64400 43100 5 18 1 1 270 0 1
title2=Culture Shock kvboard PCB
}
C 55500 50600 1 0 1 transformer-epc19.sym
{
T 55350 52200 5 10 1 1 0 6 1
refdes=T1
T 55500 52400 5 10 0 1 0 6 1
device=CS1-HVT-EPC19-04
T 55500 50600 5 10 0 0 0 0 1
description=1500V transformer
T 55500 50600 5 10 0 0 0 0 1
footprint=TXFMR_EPC19.lht
T 55500 50600 5 10 0 0 0 0 1
value=xfmr
}
C 61600 51300 1 0 0 resistor-1.sym
{
T 61900 51700 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61700 51600 5 10 1 1 0 0 1
refdes=R1
T 62000 51100 5 10 1 1 0 0 1
value=475K
T 61600 51300 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 61600 51300 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 61600 50500 1 0 0 resistor-1.sym
{
T 61900 50900 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61700 50800 5 10 1 1 0 0 1
refdes=R2
T 62000 50300 5 10 1 1 0 0 1
value=475K
T 61600 50500 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 61600 50500 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
N 54000 51700 54000 51100 4
T 56200 43400 9 12 1 0 0 0 3
2500V divided by 800 attenuation = 
3.125V, which is compatible with 
the 3.3V supply to the MCUs ADCs.
N 56100 46400 60600 46400 4
N 56000 50700 56000 48900 4
N 56000 48900 59800 48900 4
N 53500 52100 54000 52100 4
T 63950 42450 9 12 1 0 90 0 2
spring contact T2 
is a lone contact.
T 63850 44950 9 12 1 0 90 0 1
spring                     contacts                     to hold                   cuvette
N 53200 53700 52700 53700 4
N 51500 53700 50100 53700 4
N 50400 49100 51800 49100 4
C 58900 51200 1 270 0 capacitor-1.sym
{
T 59600 51000 5 10 0 0 270 0 1
device=472-3KV
T 59200 50900 5 10 1 1 0 0 1
refdes=C4
T 59800 51000 5 10 0 0 270 0 1
symversion=0.1
T 58600 50500 5 10 1 1 0 0 1
value=4.7nF
T 58900 51200 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat_flip.fp
}
N 59100 51200 59100 52100 4
N 59100 48900 59100 50300 4
N 58000 45200 58000 44700 4
L 54800 53200 54800 52600 3 10 1 0 -1 -1
L 54800 54000 55400 54000 3 10 1 0 -1 -1
L 55700 54000 56500 54000 3 10 1 0 -1 -1
L 64300 54000 64300 53300 3 10 1 0 -1 -1
L 63500 46700 63000 46700 3 10 1 0 -1 -1
T 60200 53600 9 22 1 0 0 0 1
HV Zone
L 54800 54000 54800 53500 3 10 1 0 -1 -1
L 57900 54000 58700 54000 3 10 1 0 -1 -1
L 56800 54000 57600 54000 3 10 1 0 -1 -1
L 59000 54000 59800 54000 3 10 1 0 -1 -1
L 60100 54000 60900 54000 3 10 1 0 -1 -1
L 61200 54000 61800 54000 3 10 1 0 -1 -1
L 62100 54000 62600 54000 3 10 1 0 -1 -1
L 62900 54000 63400 54000 3 10 1 0 -1 -1
L 64300 52200 64300 53000 3 10 1 0 -1 -1
L 64300 51100 64300 51900 3 10 1 0 -1 -1
L 64300 50000 64300 50800 3 10 1 0 -1 -1
L 64300 48900 64300 49700 3 10 1 0 -1 -1
L 57600 49500 58400 49500 3 10 1 0 -1 -1
L 58500 46700 59400 46700 3 10 1 0 -1 -1
L 59700 46700 60400 46700 3 10 1 0 -1 -1
L 60700 46700 61500 46700 3 10 1 0 -1 -1
L 61800 46700 62600 46700 3 10 1 0 -1 -1
T 56800 51200 9 22 1 0 0 0 1
HV Zone
L 55800 49500 55800 49700 3 10 1 0 -1 -1
C 61600 49700 1 0 0 resistor-1.sym
{
T 61900 50100 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61700 50000 5 10 1 1 0 0 1
refdes=R3
T 62000 49500 5 10 1 1 0 0 1
value=475K
T 61600 49700 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 61600 49700 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 61600 48900 1 0 0 resistor-1.sym
{
T 61900 49300 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61700 49200 5 10 1 1 0 0 1
refdes=R4
T 62000 48700 5 10 1 1 0 0 1
value=475K
T 61600 48900 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 61600 48900 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 61600 48100 1 0 0 resistor-1.sym
{
T 61900 48500 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61700 48400 5 10 1 1 0 0 1
refdes=R5
T 62000 47900 5 10 1 1 0 0 1
value=475K
T 61600 48100 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 61600 48100 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 61600 47300 1 0 0 resistor-1.sym
{
T 61900 47700 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61700 47600 5 10 1 1 0 0 1
refdes=R6
T 62000 47100 5 10 1 1 0 0 1
value=475K
T 61600 47300 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 61600 47300 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 60400 47300 1 0 0 resistor-1.sym
{
T 60700 47700 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 60500 47600 5 10 1 1 0 0 1
refdes=R7
T 60800 47100 5 10 1 1 0 0 1
value=475K
T 60400 47300 5 10 0 0 0 0 1
footprint=RESC3216N.lht
T 60400 47300 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 59200 47300 1 0 0 resistor-1.sym
{
T 59500 47700 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 59300 47600 5 10 1 1 0 0 1
refdes=R8
T 59600 47100 5 10 1 1 0 0 1
value=475K
T 59200 47300 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
T 59200 47300 5 10 0 0 0 0 1
footprint=RESC3216N.lht
}
N 61600 51400 61600 51800 4
N 52300 46600 52300 48600 4
N 52000 56100 52000 54200 4
N 50400 46600 51000 46600 4
N 51900 46600 52700 46600 4
L 56700 49500 57300 49500 3 10 1 0 -1 -1
L 55800 49500 56400 49500 3 10 1 0 -1 -1
N 50400 46600 50400 49900 4
T 39100 48800 9 12 1 0 0 0 7
ZIF connector pin numbering 
is not connected 1 to 1,
but by FFC cable with same 
side up on both boards.
Connector left pin connects to 
other end connector right pin 
as a signal goes through FFC cable.
N 55500 52100 55600 52100 4
C 39000 57200 1 180 1 ffc-zif-20.sym
{
T 39100 50600 5 10 1 1 180 6 1
refdes=J3
T 40442 52608 5 10 0 1 180 6 1
device=FC5030-20
T 39000 57200 5 10 0 0 0 0 1
value=conn
T 39000 57200 5 10 0 0 0 0 1
footprint=ffc_zif_20_1.25.lht
}
N 40300 51100 42000 51100 4
N 42000 51100 42000 51000 4
N 40300 53500 41800 53500 4
{
T 41300 53555 5 10 1 1 0 3 1
netname=VSS
}
N 40300 53800 40800 53800 4
N 40300 56800 40800 56800 4
N 40800 56500 40800 56800 4
N 40300 56500 43000 56500 4
{
T 41300 56555 5 10 1 1 0 3 1
netname=VSS
}
N 43400 52300 43400 52050 4
N 40300 55900 41200 55900 4
N 41200 55900 41200 56200 4
N 40300 56200 42500 56200 4
{
T 40850 56400 5 11 1 1 180 6 1
netname=18V_ONBOARD
}
N 40800 55600 40300 55600 4
N 40300 55300 41800 55300 4
{
T 41300 55355 5 10 1 1 0 3 1
netname=VSS
}
N 40800 55300 40800 55600 4
N 40300 55000 42700 55000 4
{
T 40400 55000 5 10 1 1 0 0 1
netname=PA5_ADC1.5_current_sense
}
N 40300 54700 43300 54700 4
{
T 40400 54850 5 10 1 1 180 6 1
netname=PA4_ADC1.4_HV_sense
}
N 40300 54400 42650 54400 4
{
T 40400 54400 5 10 1 1 0 0 1
netname=PA3_TIM5.4
}
N 40300 54100 42650 54100 4
{
T 40300 54100 5 10 1 1 0 0 1
netname=PA2_USART2_TX_TIM5.3
}
N 40300 52600 41800 52600 4
{
T 41300 52655 5 10 1 1 0 3 1
netname=VSS
}
N 40800 52600 40800 52900 4
N 40300 51400 42500 51400 4
N 40300 51700 42500 51700 4
N 40300 52000 41800 52000 4
{
T 41300 52055 5 10 1 1 0 3 1
netname=VSS
}
N 40300 52900 40800 52900 4
N 44000 53200 44000 53850 4
N 40800 53500 40800 53800 4
N 53200 49100 53200 49700 4
N 52600 47800 52600 46600 4
N 52400 48300 50400 48300 4
N 52100 54500 50100 54500 4
N 40300 52300 43400 52300 4
{
T 40600 52450 5 10 1 1 180 6 1
netname=PA0_TIM2_CH1/TIM2_ETR
}
N 40300 53200 44600 53200 4
{
T 40600 53350 5 10 1 1 180 6 1
netname=PA1_TIM5_CH2
}
N 44000 54750 44000 54900 4
N 46900 52900 47150 52900 4
N 47150 52900 47150 54900 4
N 46900 53200 47600 53200 4
N 47600 54750 47600 54900 4
C 51000 46500 1 0 0 resistor-1.sym
{
T 51300 46900 5 10 0 0 0 0 1
device=R_3.30k_1%_1608
T 51650 46450 5 10 1 1 180 0 1
refdes=R10
T 51650 46850 5 10 1 1 180 0 1
value=3.30k
T 51000 46500 5 10 0 0 270 0 1
description=Res thick 3.30k 1%   
T 51000 46500 5 10 0 0 270 0 1
footprint=RESC1608N.lht
}
C 44100 53850 1 90 0 resistor-1.sym
{
T 43700 54150 5 10 0 0 90 0 1
device=R_4.7R_1%_1608
T 43800 54050 5 10 1 1 90 0 1
refdes=R15
T 44300 54250 5 10 1 1 90 0 1
value=4.70K
T 44100 53850 5 10 0 0 0 0 1
description=Res thick 4.70k 1% 1608
T 44100 53850 5 10 0 0 0 0 1
footprint=RESC1608N.lht
}
N 46900 53500 48200 53500 4
{
T 47000 53550 5 10 1 1 0 0 1
netname=PUSH_DRIVE
}
N 47600 52050 47600 53850 4
N 47600 52050 43400 52050 4
T 52100 47700 9 12 1 0 0 6 2
alt. transistors
use one
N 50400 49900 50900 49900 4
N 51800 49900 53500 49900 4
N 52900 54500 53500 54500 4
N 50600 52900 50100 52900 4
N 51500 52900 53500 52900 4
N 52300 55000 52300 56100 4
N 53200 53700 53200 52900 4
C 42650 54000 1 0 0 nc-right-1.sym
{
T 42750 54500 5 10 0 0 0 0 1
value=NoConnection
T 42750 54700 5 10 0 0 0 0 1
device=DRC_Directive
}
C 42650 54300 1 0 0 nc-right-1.sym
{
T 42750 54800 5 10 0 0 0 0 1
value=NoConnection
T 42750 55000 5 10 0 0 0 0 1
device=DRC_Directive
}
C 42500 51300 1 0 0 nc-right-1.sym
{
T 42600 51800 5 10 0 0 0 0 1
value=NoConnection
T 42600 52000 5 10 0 0 0 0 1
device=DRC_Directive
}
C 42500 51600 1 0 0 nc-right-1.sym
{
T 42600 52100 5 10 0 0 0 0 1
value=NoConnection
T 42600 52300 5 10 0 0 0 0 1
device=DRC_Directive
}
T 56900 55600 9 12 1 0 0 0 7
layout two vias to gnd 
near TXFMR pads
(heatsink), and
put Schottkys in close,
and caps in close,

and transistors!
L 55100 53000 56600 55600 3 10 1 0 -1 -1
B 56600 54600 2600 2800 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 50900 50100 1 180 1 schottky.sym
{
T 51300 49500 5 10 0 0 0 2 1
device=B5819WS
T 51900 50000 5 10 1 1 0 6 1
refdes=D6
T 51700 50200 5 10 1 1 0 6 1
value=.9V .5W
T 51100 50150 5 10 0 1 270 6 1
footprint=SOD-323N.lht
}
N 51300 56100 52400 56100 4
N 53300 56100 54000 56100 4
{
T 53300 56150 5 10 1 1 0 0 1
netname=PULL_DRIVE
}
N 50400 56100 50100 56100 4
C 53300 56000 1 0 1 resistor-1.sym
{
T 53000 56400 5 10 0 0 180 2 1
device=Res_3.30k_1%_1608
T 52750 55950 5 10 1 1 180 6 1
refdes=R13
T 53300 56000 5 10 0 1 0 2 1
footprint=RESC1608N.lht
T 52550 56350 5 10 1 1 180 6 1
value=3.30k
T 53300 56000 5 10 0 0 0 2 1
description=Res thick 3.30k Ohm 1%
}
N 51900 51400 54000 51400 4
{
T 52750 51600 5 11 1 1 180 6 1
netname=18V_ONBOARD
}
C 57000 51900 1 0 0 diode-1.sym
{
T 57400 52500 5 10 0 0 0 0 1
device=M20F
T 57600 52500 5 10 1 1 180 0 1
refdes=D3
T 57700 51800 5 10 1 1 180 0 1
value=2KV
T 57000 51900 5 10 0 0 0 0 1
description=diode rect 2000V 1A SMAF
T 57000 51900 5 10 0 0 0 0 1
footprint=DIOM_SMAFN.lht
}
C 56800 50100 1 90 0 diode-1.sym
{
T 56200 50500 5 10 0 0 90 0 1
device=M20F
T 56100 50500 5 10 1 1 0 0 1
refdes=D7
T 56800 50500 5 10 1 1 0 0 1
value=2KV
T 56800 50100 5 10 0 0 90 0 1
description=diode rect 2000V 1A SMAF
T 56800 50100 5 10 0 0 90 0 1
footprint=DIOM_SMAFN.lht
}
N 56600 51000 56600 52100 4
N 59200 47400 59200 46400 4
C 59200 45200 1 90 0 capacitor-variable-1.sym
{
T 58500 45400 5 10 0 0 90 0 1
device=TZC3Z300A110
T 58900 45900 5 10 1 1 180 0 1
refdes=C15
T 58300 45400 5 10 0 0 90 0 1
symversion=0.1
T 59100 45300 5 10 1 1 0 0 1
value=30pF
T 59200 45200 5 10 0 0 0 0 1
footprint=CAP_VAR3040N.lht
}
C 61500 45400 1 0 0 resistor-1.sym
{
T 61800 45800 5 10 0 0 0 0 1
device=R_22.0_1%_1608
T 61400 45600 5 10 1 1 0 0 1
refdes=R25
T 62300 45300 5 10 1 1 0 0 1
value=22
T 61500 45400 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 61500 45400 5 10 0 0 0 0 1
description=Res thick 22.0 1% 1608
}
N 61500 45500 60600 45500 4
N 60600 44000 60600 46400 4
N 61500 44000 60600 44000 4
N 61500 44300 60600 44300 4
N 62400 44000 63100 44000 4
N 63100 42300 63100 45500 4
N 62400 44900 63100 44900 4
N 62400 44300 63100 44300 4
N 62400 44600 63100 44600 4
N 61500 44600 60600 44600 4
N 61500 44900 60600 44900 4
N 62400 45200 63100 45200 4
N 61500 45200 60600 45200 4
N 62400 45500 63100 45500 4
{
T 62500 45550 5 10 1 1 0 0 1
netname=LOW_SIDE
}
N 63300 44400 63100 44400 4
N 59000 46400 59000 46100 4
N 59000 45200 59000 44700 4
T 61100 42800 9 12 1 0 0 0 4
Current sense R's
paralleled so they 
will not likely go 
open circuit.
N 58700 42300 61700 42300 4
{
T 58900 42300 5 10 1 1 0 0 1
netname=PA5_ADC1.5_current_sense
}
N 62600 42300 63100 42300 4
T 60300 45900 9 12 1 0 0 0 2
probe comp.
capacitance
N 62500 51400 62500 50600 4
L 58500 47800 58500 48600 3 10 1 0 -1 -1
L 58500 46700 58500 47500 3 10 1 0 -1 -1
L 64300 46700 64300 47500 3 10 1 0 -1 -1
L 64300 47800 64300 48600 3 10 1 0 -1 -1
N 60100 47400 60400 47400 4
N 61300 47400 61600 47400 4
N 62500 47400 62500 48200 4
N 61600 48200 61600 49000 4
N 61600 50600 61600 49800 4
N 62500 49800 62500 49000 4
N 59900 45200 59900 44700 4
C 60100 45200 1 90 0 capacitor-variable-1.sym
{
T 59800 45900 5 10 1 1 180 0 1
refdes=C16
T 60000 45300 5 10 1 1 0 0 1
value=6pF
T 59400 45400 5 10 0 0 90 0 1
device=TZC3Z060A110
T 59200 45400 5 10 0 0 90 0 1
symversion=0.1
T 60100 45200 5 10 0 0 0 0 1
footprint=CAP_VAR3040N.lht
}
N 59900 46400 59900 46100 4
N 51700 56100 51700 57600 4
C 52100 45800 1 0 1 resistor-1.sym
{
T 51800 46200 5 10 0 0 180 2 1
device=R_22.0_1%_1608
T 51700 45600 5 10 1 1 0 6 1
refdes=R17
T 51800 46100 5 10 1 1 0 6 1
value=22
T 52100 45800 5 10 0 0 180 2 1
footprint=RESC1608N.lht
T 52100 45800 5 10 0 0 180 2 1
description=Res thick 22.0 1% 1608
}
N 52100 46600 52100 45900 4
T 44100 44400 9 14 1 0 0 0 1
Lockout when cover open
N 45700 46000 45700 47600 4
T 43600 44100 9 14 1 0 0 0 1
wires to dual normally open limit switch
C 52100 55000 1 270 0 NFET_enh.sym
{
T 52800 54900 5 10 1 1 0 0 1
device=NTR5198NL
T 52500 55200 5 10 1 1 0 0 1
refdes=Q1
T 52100 55000 5 10 0 0 270 0 1
footprint=SOT23-3N.lht
T 52100 55000 5 10 0 0 270 0 1
description=MOSFET N-CH 60V 1.7A SOT23
T 52100 55000 5 10 0 0 0 0 1
value=semicon
}
C 52400 47800 1 270 1 NFET_enh.sym
{
T 53900 47600 5 10 1 1 0 6 1
device=NTR5198NL
T 53200 47800 5 10 1 1 0 6 1
refdes=Q2
T 52400 47800 5 10 0 0 270 6 1
footprint=SOT23-3N.lht
T 52400 47800 5 10 0 0 270 6 1
description=MOSFET N-CH 60V 1.7A SOT23
T 52400 47800 5 10 0 0 0 0 1
value=semicon
}
C 61500 45100 1 0 0 resistor-1.sym
{
T 61800 45500 5 10 0 0 0 0 1
device=R_22.0_1%_1608
T 61400 45300 5 10 1 1 0 0 1
refdes=R24
T 62300 45000 5 10 1 1 0 0 1
value=22
T 61500 45100 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 61500 45100 5 10 0 0 0 0 1
description=Res thick 22.0 1% 1608
}
C 61500 44800 1 0 0 resistor-1.sym
{
T 61800 45200 5 10 0 0 0 0 1
device=R_22.0_1%_1608
T 61400 45000 5 10 1 1 0 0 1
refdes=R23
T 62300 44700 5 10 1 1 0 0 1
value=22
T 61500 44800 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 61500 44800 5 10 0 0 0 0 1
description=Res thick 22.0 1% 1608
}
C 61500 44500 1 0 0 resistor-1.sym
{
T 61800 44900 5 10 0 0 0 0 1
device=R_22.0_1%_1608
T 61400 44700 5 10 1 1 0 0 1
refdes=R22
T 62300 44400 5 10 1 1 0 0 1
value=22
T 61500 44500 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 61500 44500 5 10 0 0 0 0 1
description=Res thick 22.0 1% 1608
}
C 61500 44200 1 0 0 resistor-1.sym
{
T 61800 44600 5 10 0 0 0 0 1
device=R_22.0_1%_1608
T 61400 44400 5 10 1 1 0 0 1
refdes=R21
T 62300 44100 5 10 1 1 0 0 1
value=22
T 61500 44200 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 61500 44200 5 10 0 0 0 0 1
description=Res thick 22.0 1% 1608
}
C 61500 43900 1 0 0 resistor-1.sym
{
T 61800 44300 5 10 0 0 0 0 1
device=R_22.0_1%_1608
T 61400 44100 5 10 1 1 0 0 1
refdes=R20
T 62300 43800 5 10 1 1 0 0 1
value=22
T 61500 43900 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 61500 43900 5 10 0 0 0 0 1
description=Res thick 22.0 1% 1608
}
C 50800 57700 1 180 1 resistor-1.sym
{
T 51100 57300 5 10 0 0 0 2 1
device=R_22.0_1%_1608
T 51300 57500 5 10 1 1 180 6 1
refdes=R18
T 51200 57900 5 10 1 1 180 6 1
value=22
T 50800 57700 5 10 0 0 0 2 1
footprint=RESC1608N.lht
T 50800 57700 5 10 0 0 0 2 1
description=Res thick 22.0 1% 1608
}
C 46300 44700 1 90 0 ffc-zif-6.sym
{
T 46500 45200 5 10 1 1 180 0 1
refdes=J4
T 46300 44700 5 10 0 0 0 0 1
footprint=ffc_zif_20_1.25.lht
T 46300 44700 5 10 0 0 0 0 1
device=FC5030-06
T 46300 44700 5 10 0 0 0 0 1
value=conn
}
N 45400 46800 45400 46000 4
{
T 45350 46800 5 10 1 1 90 6 1
netname=Q1_OFF
}
C 44600 46000 1 90 0 nc-right-1.sym
{
T 44100 46100 5 10 0 0 90 0 1
value=NoConnection
T 43900 46100 5 10 0 0 90 0 1
device=DRC_Directive
}
C 44900 46000 1 90 0 nc-right-1.sym
{
T 44400 46100 5 10 0 0 90 0 1
value=NoConnection
T 44200 46100 5 10 0 0 90 0 1
device=DRC_Directive
}
C 45200 46000 1 90 0 nc-right-1.sym
{
T 44700 46100 5 10 0 0 90 0 1
value=NoConnection
T 44500 46100 5 10 0 0 90 0 1
device=DRC_Directive
}
C 47700 53850 1 90 0 resistor-1.sym
{
T 47300 54150 5 10 0 0 90 0 1
device=R_4.7R_1%_1608
T 47400 54050 5 10 1 1 90 0 1
refdes=R16
T 47900 54250 5 10 1 1 90 0 1
value=4.70K
T 47700 53850 5 10 0 0 0 0 1
description=Res thick 4.70k 1% 1608
T 47700 53850 5 10 0 0 0 0 1
footprint=RESC1608N.lht
}
C 41900 50700 1 0 0 vss.sym
C 42900 55800 1 0 0 vss.sym
N 43000 56100 43000 56500 4
C 58200 44400 1 0 0 vss.sym
C 49800 56200 1 270 0 vss.sym
C 57300 45200 1 90 0 resistor-1.sym
{
T 56900 45500 5 10 0 0 90 0 1
device=R_9.10k_1%_1608
T 57000 45500 5 10 1 1 90 0 1
refdes=R30
T 57500 45600 5 10 1 1 90 0 1
value=9.10K
T 57300 45200 5 10 0 0 0 0 1
description=9.10k  ±1% 1608
T 57300 45200 5 10 0 0 0 0 1
footprint=RESC1608N.lht
}
C 58100 45200 1 90 0 resistor-1.sym
{
T 57700 45500 5 10 0 0 90 0 1
device=R_9.10k_1%_1608
T 57800 45400 5 10 1 1 90 0 1
refdes=R31
T 58300 45600 5 10 1 1 90 0 1
value=9.10K
T 58100 45200 5 10 0 0 0 0 1
description=9.10k  ±1% 1608
T 58100 45200 5 10 0 0 0 0 1
footprint=RESC1608N.lht
}
N 57200 45200 57200 44700 4
N 57200 46100 57200 46400 4
N 58000 46100 58000 46400 4
C 50600 52700 1 0 0 schottky.sym
{
T 51000 53300 5 10 0 0 0 0 1
device=B5819WS
T 51400 53000 5 10 1 1 0 0 1
refdes=D5
T 50500 53200 5 10 1 1 0 0 1
value=.9V .5W
T 50800 52650 5 10 0 1 270 0 1
footprint=SOD-323N.lht
}
L 64300 46700 63800 46700 3 10 1 0 -1 -1
L 63700 54000 64300 54000 3 10 1 0 -1 -1
T 63950 52150 9 12 1 0 90 0 4
spring contact T1 
has cutout and 
R locations in 
footprint.
C 64250 44300 1 0 1 cuvette_cont.sym
{
T 63940 45050 5 10 0 0 0 6 1
device=36-110
T 63940 44900 5 10 0 0 0 6 1
footprint=cuvette_cont_notch.lht
T 64000 44350 5 10 1 1 0 0 1
refdes=J2
T 64250 44300 5 10 0 0 0 0 1
value=conn
}
C 64050 51900 1 180 0 cuvette_cont.sym
{
T 63740 51150 5 10 0 0 180 0 1
device=36-110
T 63740 51300 5 10 0 0 180 0 1
footprint=cuvette_cont_resistors.lht
T 63800 51850 5 10 1 1 180 6 1
refdes=J1
T 64050 51900 5 10 0 0 0 0 1
value=conn
}
C 51500 54200 1 270 0 NFET_enh_TSOT-26.sym
{
T 51200 53300 5 10 1 1 0 0 1
device=DMN4060SVT
T 52350 53900 5 10 1 1 0 0 1
refdes=Q11
T 51500 54200 5 10 0 0 270 0 1
description=MOSFET N-CH 45V 4.8A TSOT-26
T 51500 54200 5 10 0 0 270 0 1
footprint=TSOT-26N.lht
T 51500 54200 5 10 0 0 0 0 1
value=semicon
}
N 53200 53500 52700 53500 4
N 53200 53300 52700 53300 4
C 51800 48600 1 270 1 NFET_enh_TSOT-26.sym
{
T 52600 49300 5 10 1 1 0 6 1
device=DMN4060SVT
T 53050 48800 5 10 1 1 0 6 1
refdes=Q12
T 51800 48600 5 10 0 0 270 6 1
description=MOSFET N-CH 45V 4.8A TSOT-26
T 51800 48600 5 10 0 0 270 6 1
footprint=TSOT-26N.lht
T 51800 48600 5 10 0 0 0 0 1
value=semicon
}
N 53000 49100 53200 49100 4
N 53000 49500 53200 49500 4
N 53000 49700 53500 49700 4
N 53000 49300 53200 49300 4
N 53200 48300 53500 48300 4
N 53000 50700 54000 50700 4
N 52700 53100 53200 53100 4
T 51500 55900 9 12 1 0 270 0 2
alt. transistors
use one
C 58300 52900 1 0 0 diode-1.sym
{
T 58700 53500 5 10 0 0 0 0 1
device=S1Y
T 58600 53500 5 10 1 1 0 0 1
refdes=D2
T 58600 52700 5 10 1 1 0 0 1
value=2KV
T 58300 52900 5 10 0 0 0 0 1
description=diode rect 2000V 1A DO-15
T 58300 52900 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
C 57400 52900 1 0 0 diode-1.sym
{
T 57800 53500 5 10 0 0 0 0 1
device=S1Y
T 57700 53500 5 10 1 1 0 0 1
refdes=D1
T 57700 52700 5 10 1 1 0 0 1
value=2KV
T 57400 52900 5 10 0 0 0 0 1
description=diode rect 2000V 1A DO-15
T 57400 52900 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
N 57400 53100 57000 53100 4
N 57000 53100 57000 52100 4
N 59200 53100 59200 52100 4
N 57500 50500 57500 51000 4
N 57500 51000 56600 51000 4
N 57500 49600 57500 48900 4
C 57700 49600 1 90 0 diode-1.sym
{
T 57100 50000 5 10 0 0 90 0 1
device=S1Y
T 57000 50000 5 10 1 1 0 0 1
refdes=D8
T 57700 50000 5 10 1 1 0 0 1
value=2KV
T 57700 49600 5 10 0 0 90 0 1
description=diode rect 2000V 1A DO-15
T 57700 49600 5 10 0 0 90 0 1
footprint=diode_10mm.fp
}
N 44000 54900 47600 54900 4
{
T 45050 55100 5 11 1 1 180 6 1
netname=18V_ONBOARD
}
C 51900 51000 1 180 0 capacitor-1.sym
{
T 51700 50300 5 10 0 0 180 0 1
device=CL31A106MBHNNNE
T 51700 50100 5 10 0 0 180 0 1
symversion=0.1
T 51900 51000 5 10 0 0 270 0 1
description=CAP CER 10UF 50V X5R 1206 
T 51900 51000 5 10 0 0 270 0 1
footprint=CAPC3216N.lht
T 51300 51000 5 10 1 1 180 0 1
refdes=C6
T 51600 50600 5 10 1 1 0 0 1
value=10 uF
T 51800 51200 5 10 0 1 270 0 1
comment=X5R
}
C 48900 50600 1 0 0 capacitor-2.sym
{
T 49100 51300 5 10 0 0 0 0 1
device=UUX1E221MNL1GS
T 49100 51500 5 10 0 0 0 0 1
symversion=0.1
T 48900 50600 5 10 0 0 90 0 1
description=CAP ALUM 220UF 20% 25V SMD
T 48900 50600 5 10 0 0 90 0 1
footprint=CAPAE10X10.lht
T 49700 50500 5 10 1 1 90 0 1
refdes=C7
T 49200 50700 5 10 1 1 180 0 1
value=220 uF
}
C 48900 51200 1 0 0 capacitor-2.sym
{
T 49100 51900 5 10 0 0 0 0 1
device=UUX1E221MNL1GS
T 49100 52100 5 10 0 0 0 0 1
symversion=0.1
T 48900 51200 5 10 0 0 90 0 1
description=CAP ALUM 220UF 20% 25V SMD
T 48900 51200 5 10 0 0 90 0 1
footprint=CAPAE10X10.lht
T 49700 51100 5 10 1 1 90 0 1
refdes=C8
T 49200 51300 5 10 1 1 180 0 1
value=220 uF
}
C 51900 52200 1 180 0 capacitor-1.sym
{
T 51700 51500 5 10 0 0 180 0 1
device=CL21B105KBFNFNE
T 51700 51300 5 10 0 0 180 0 1
symversion=0.1
T 51900 52200 5 10 0 0 270 0 1
description=CAP CER 1UF 50V X7R
T 51900 52200 5 10 0 0 270 0 1
footprint=CAPC2013N.lht
T 51300 52200 5 10 1 1 180 0 1
refdes=C10
T 51600 51800 5 10 1 1 0 0 1
value=1 uF
T 51800 52400 5 10 0 1 270 0 1
comment=X5R
}
C 51900 51600 1 180 0 capacitor-1.sym
{
T 51700 50900 5 10 0 0 180 0 1
device=CL31A106MBHNNNE
T 51700 50700 5 10 0 0 180 0 1
symversion=0.1
T 51900 51600 5 10 0 0 270 0 1
description=CAP CER 10UF 50V X5R 1206 
T 51900 51600 5 10 0 0 270 0 1
footprint=CAPC3216N.lht
T 51300 51600 5 10 1 1 180 0 1
refdes=C11
T 51600 51200 5 10 1 1 0 0 1
value=10 uF
T 51800 51800 5 10 0 1 270 0 1
comment=X5R
}
N 52600 52000 51900 52000 4
N 51900 50800 53000 50800 4
N 48900 50800 48600 50800 4
N 48900 51400 48600 51400 4
N 49800 51400 50000 51400 4
N 50500 52900 50500 49900 4
N 49800 50800 50000 50800 4
N 51000 52000 50500 52000 4
N 51000 51400 50500 51400 4
N 51000 50800 50500 50800 4
C 50100 50800 1 0 0 vss.sym
N 53800 43900 56100 43900 4
{
T 53800 44050 5 10 1 1 180 6 1
netname=PA4_ADC1.4_HV_sense
}
N 44600 53500 44600 54900 4
L 55200 50400 55800 50400 3 10 1 0 -1 -1
L 55800 50000 55800 50400 3 10 1 0 -1 -1
N 56000 50700 55500 50700 4
L 55000 52800 55200 52900 3 10 1 0 -1 -1
L 55000 53100 55200 52900 3 10 1 0 -1 -1
L 55000 53100 55000 52800 3 10 1 0 -1 -1
N 50800 57600 50000 57600 4
{
T 50700 57650 5 10 1 1 0 6 1
netname=Q1_OFF
}
C 45800 47300 1 0 0 vss.sym
N 45700 47600 45900 47600 4
N 50400 45900 51200 45900 4
{
T 50500 45950 5 10 1 1 180 8 1
netname=Q2_OFF
}
C 50300 49100 1 0 1 vss.sym
N 50100 56100 50100 52900 4
N 46000 46800 46000 46000 4
{
T 45950 46800 5 10 1 1 90 6 1
netname=Q2_OFF
}
N 53500 48300 53500 50700 4
{
T 53550 49200 5 10 1 1 270 0 1
netname=PUSH
}
N 43400 52900 44600 52900 4
{
T 43500 52950 5 10 1 1 0 0 1
netname=PULL_DRIVE
}
N 54900 46600 53600 46600 4
{
T 54800 46650 5 10 1 1 0 6 1
netname=PUSH_DRIVE
}
N 53500 54500 53500 52100 4
{
T 53550 54000 5 10 1 1 270 0 1
netname=PULL
}
N 50000 50800 50000 51400 4
N 52600 51400 52600 52000 4
N 48600 51700 50000 51700 4
{
T 48550 51900 5 11 1 1 180 6 1
netname=18V_ONBOARD
}
N 53000 50800 53000 50700 4
N 56100 45200 56100 43900 4
N 50000 51100 50500 51100 4
N 50200 49400 50400 49400 4
N 48600 51700 48600 50800 4
C 52700 46500 1 0 0 resistor-1.sym
{
T 53000 46900 5 10 0 0 0 0 1
device=R_3.30k_1%_1608
T 53350 46450 5 10 1 1 180 0 1
refdes=R12
T 53350 46850 5 10 1 1 180 0 1
value=3.30k
T 52700 46500 5 10 0 0 270 0 1
description=Res thick 3.30k 1%   
T 52700 46500 5 10 0 0 270 0 1
footprint=RESC1608N.lht
}
T 53000 47000 9 12 1 0 0 0 1
3.40k subs
T 51200 47000 9 12 1 0 0 0 1
3.40k subs
T 52200 56500 9 12 1 0 0 0 1
3.40k subs
C 51300 56000 1 0 1 resistor-1.sym
{
T 51000 56400 5 10 0 0 180 2 1
device=Res_3.30k_1%_1608
T 50750 55950 5 10 1 1 180 6 1
refdes=R11
T 51300 56000 5 10 0 1 0 2 1
footprint=RESC1608N.lht
T 50550 56350 5 10 1 1 180 6 1
value=3.30k
T 51300 56000 5 10 0 0 0 2 1
description=Res thick 3.30k Ohm 1%
}
T 50100 56400 9 12 1 0 0 0 1
3.40k subs
C 50900 45900 1 270 0 capacitor-1.sym
{
T 51600 45700 5 10 0 0 270 0 1
device=06033C104KAT2A
T 51800 45700 5 10 0 0 270 0 1
symversion=0.1
T 50600 45500 5 10 1 1 0 0 1
refdes=C18
T 50500 45200 5 10 1 1 0 0 1
value=0.1 uF 25V
T 50900 45900 5 10 0 0 0 0 1
footprint=CAPC1608N.lht
}
C 51200 44700 1 0 1 vss.sym
C 50800 56900 1 0 0 capacitor-1.sym
{
T 51000 57600 5 10 0 0 0 0 1
device=06033C104KAT2A
T 51000 57800 5 10 0 0 0 0 1
symversion=0.1
T 51100 57000 5 10 1 1 180 0 1
refdes=C19
T 51100 57300 5 10 1 1 180 0 1
value=0.1 uF 25V
T 50800 56900 5 10 0 0 90 0 1
footprint=CAPC1608N.lht
}
C 50600 56800 1 0 1 vss.sym
N 50800 57100 50500 57100 4
C 44600 52300 1 0 0 PFET_enh_dual.sym
{
T 45100 54150 5 14 1 1 0 3 1
refdes=U1
T 45100 52400 5 10 1 1 0 0 1
footprint=SOT563-6-M.lht
T 45400 54200 5 10 1 1 0 0 1
device=NTZD3152PT1G
T 44600 52300 5 10 0 0 0 0 1
value=semicon
}
C 56000 46100 1 270 0 EMBEDDEDresistor-1.sym
[
L 56200 45500 56000 45600 3 0 0 0 -1 -1
L 56000 45600 56200 45700 3 0 0 0 -1 -1
L 56200 45700 56000 45800 3 0 0 0 -1 -1
L 56000 45800 56200 45900 3 0 0 0 -1 -1
L 56200 45500 56000 45400 3 0 0 0 -1 -1
L 56000 45400 56100 45350 3 0 0 0 -1 -1
P 56100 45200 56100 45350 1 0 0
{
T 56150 45300 5 8 0 1 270 0 1
pinnumber=2
T 56150 45300 5 8 0 0 270 0 1
pinseq=2
T 56150 45300 5 8 0 1 270 0 1
pinlabel=2
T 56150 45300 5 8 0 1 270 0 1
pintype=pas
}
P 56100 46100 56100 45948 1 0 0
{
T 56150 46000 5 8 0 1 270 0 1
pinnumber=1
T 56150 46000 5 8 0 0 270 0 1
pinseq=1
T 56150 46000 5 8 0 1 270 0 1
pinlabel=1
T 56150 46000 5 8 0 1 270 0 1
pintype=pas
}
L 56200 45899 56100 45950 3 0 0 0 -1 -1
T 56400 45800 5 10 0 0 270 0 1
device=RESISTOR
T 56300 45900 8 10 0 1 270 0 1
refdes=R?
T 56000 46100 8 10 0 1 270 0 1
pins=2
T 56000 46100 8 10 0 1 270 0 1
class=DISCRETE
]
{
T 56400 45800 5 10 0 0 270 0 1
device=R_274_1%_1608
T 56000 46100 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 55900 45400 5 10 1 1 90 0 1
refdes=R14
T 56400 45700 5 10 1 1 90 0 1
value=274
}
C 57000 48600 1 0 0 vss.sym
N 56100 46100 56100 46400 4
C 61700 42200 1 0 0 EMBEDDEDresistor-1.sym
[
L 62300 42400 62200 42200 3 0 0 0 -1 -1
L 62200 42200 62100 42400 3 0 0 0 -1 -1
L 62100 42400 62000 42200 3 0 0 0 -1 -1
L 62000 42200 61900 42400 3 0 0 0 -1 -1
L 62300 42400 62400 42200 3 0 0 0 -1 -1
L 62400 42200 62450 42300 3 0 0 0 -1 -1
P 62600 42300 62450 42300 1 0 0
{
T 62500 42350 5 8 0 1 0 0 1
pinnumber=2
T 62500 42350 5 8 0 0 0 0 1
pinseq=2
T 62500 42350 5 8 0 1 0 0 1
pinlabel=2
T 62500 42350 5 8 0 1 0 0 1
pintype=pas
}
P 61700 42300 61852 42300 1 0 0
{
T 61800 42350 5 8 0 1 0 0 1
pinnumber=1
T 61800 42350 5 8 0 0 0 0 1
pinseq=1
T 61800 42350 5 8 0 1 0 0 1
pinlabel=1
T 61800 42350 5 8 0 1 0 0 1
pintype=pas
}
L 61901 42400 61850 42300 3 0 0 0 -1 -1
T 62000 42600 5 10 0 0 0 0 1
device=RESISTOR
T 61900 42500 8 10 0 1 0 0 1
refdes=R?
T 61700 42200 8 10 0 1 0 0 1
pins=2
T 61700 42200 8 10 0 1 0 0 1
class=DISCRETE
]
{
T 62000 42600 5 10 0 0 0 0 1
device=R_274_1%_1608
T 61700 42200 5 10 0 0 180 0 1
footprint=RESC1608N.lht
T 62400 42100 5 10 1 1 180 0 1
refdes=R26
T 62100 42600 5 10 1 1 180 0 1
value=274
}
