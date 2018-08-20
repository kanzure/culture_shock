v 20150930 2
N 58800 52100 59800 52100 4
{
T 59300 52200 5 10 1 1 0 0 1
netname=doubler_out
}
C 57900 51900 1 0 0 diode-1.sym
{
T 58300 52500 5 10 0 0 0 0 1
device=S1Y
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
T 56400 51900 5 10 1 1 180 0 1
refdes=C1
T 55800 52800 5 10 0 0 0 0 1
symversion=0.1
T 56300 52500 5 10 1 1 180 0 1
value=4.7nF
T 55600 51900 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat.fp
}
N 56500 52100 57000 52100 4
{
T 56700 52100 5 10 1 1 0 0 1
netname=V2
}
N 56500 52100 56500 53000 4
N 56600 48900 56600 49400 4
N 59800 50900 59800 52100 4
C 55600 52800 1 0 0 capacitor-1.sym
{
T 55800 53500 5 10 0 0 0 0 1
device=472-3KV
T 56400 52900 5 10 1 1 180 0 1
refdes=C2
T 55800 53700 5 10 0 0 0 0 1
symversion=0.1
T 56300 53400 5 10 1 1 180 0 1
value=4.7nF
T 55600 52800 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat_flip.fp
}
N 58100 44700 60800 44700 4
N 59800 48900 59800 50000 4
N 59800 51800 63100 51800 4
N 55600 53000 55600 52100 4
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
rev=2018-08-03 v0.6-asbuilt
T 64400 43100 5 18 1 1 270 0 1
title2=Culture Shock kvboard PCB
}
C 54000 50500 1 0 0 transformer-epc19.sym
{
T 54150 52200 5 10 1 1 0 0 1
refdes=T1
T 54000 52300 5 10 0 1 0 0 1
device=CS1-HVT-EPC19-04
T 54000 50500 5 10 0 0 0 6 1
description=1500V transformer
T 54000 50500 5 10 0 0 0 6 1
footprint=TXFMR_EPC19.lht
T 54000 50500 5 10 0 0 0 6 1
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
T 56300 47000 9 12 1 0 0 0 6
2500V divided by 800 
attenuation = 
3.125V, which is 
compatible with 
the 3.3V supply 
to the MCUs ADCs.
N 55400 45600 56400 45600 4
{
T 55500 45750 5 10 1 1 180 6 1
netname=HV_sense
}
N 56000 50700 56000 48900 4
N 56000 48900 59800 48900 4
N 53500 52100 54000 52100 4
T 63950 42450 9 12 1 0 90 0 2
spring contact T2 
is a lone contact.
T 63850 44950 9 12 1 0 90 0 1
spring                     contacts                     to hold                   cuvette
N 53200 53700 52700 53700 4
N 49300 53700 51500 53700 4
N 49300 49100 51500 49100 4
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
N 58900 45200 58900 44700 4
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
L 57700 49500 58500 49500 3 10 1 0 -1 -1
L 58500 46700 59400 46700 3 10 1 0 -1 -1
L 59700 46700 60400 46700 3 10 1 0 -1 -1
L 60700 46700 61500 46700 3 10 1 0 -1 -1
L 61800 46700 62600 46700 3 10 1 0 -1 -1
T 58700 49500 9 22 1 0 0 0 1
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
N 52000 46700 52000 48600 4
N 52000 56000 52000 54200 4
L 56700 49500 57300 49500 3 10 1 0 -1 -1
L 55800 49500 56400 49500 3 10 1 0 -1 -1
N 51500 47600 51500 49100 4
T 44100 55000 9 12 1 0 0 0 11
ZIF connector pin 
numbering is not 
connected 1 to 1,
but by FFC cable 
with same side up 
on both boards.
Connector left pin 
connects to other 
end connector right 
pin as a signal goes 
through FFC cable.
N 41000 48200 41000 48600 4
N 53200 49100 53200 49700 4
N 52500 47800 52500 46700 4
N 52300 48300 51500 48300 4
N 52300 54500 51500 54500 4
N 41000 49500 41000 49900 4
N 44500 48200 45200 48200 4
N 45200 47000 45200 49000 4
T 49900 47900 9 12 1 0 0 0 2
3 alt. transistors
use only one
N 48900 49900 51200 49900 4
N 52100 49900 53500 49900 4
N 53100 54500 53500 54500 4
N 51200 52900 48800 52900 4
N 52100 52900 53500 52900 4
N 52500 55000 52500 56000 4
N 53200 53700 53200 52900 4
T 56900 55900 9 12 1 0 0 0 6
layout two vias to gnd 
near TXFMR pads
(heatsink), and
put Schottkys in close,
and caps in array 
with clearance,
L 55100 53000 56600 55600 3 10 1 0 -1 -1
B 56600 54600 2600 2800 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 51200 50100 1 180 1 schottky.sym
{
T 51500 50300 5 10 1 1 0 2 1
device=B5819WS
T 52200 50000 5 10 1 1 0 6 1
refdes=D6
T 52200 50400 5 10 1 1 0 6 1
value=.9V .5W
T 51400 50150 5 10 0 1 270 6 1
footprint=SOD-323N.lht
}
N 51500 55100 51500 53700 4
N 48800 51400 54000 51400 4
{
T 52250 51600 5 11 1 1 180 6 1
netname=ONBOARD_18V
}
C 57000 51900 1 0 0 diode-1.sym
{
T 57400 52500 5 10 0 0 0 0 1
device=S1Y
T 57600 52500 5 10 1 1 180 0 1
refdes=D3
T 57700 51800 5 10 1 1 180 0 1
value=2KV
T 57000 51900 5 10 0 0 0 0 1
description=diode rect 2000V 1A SMAF
T 57000 51900 5 10 0 0 0 0 1
footprint=DIOM_SMAFN.lht
}
C 56800 49400 1 90 0 diode-1.sym
{
T 56200 49800 5 10 0 0 90 0 1
device=S1Y
T 56200 50100 5 10 1 1 0 0 1
refdes=D7
T 56900 49700 5 10 1 1 0 0 1
value=2KV
T 56800 49400 5 10 0 0 90 0 1
description=diode rect 2000V 1A SMAF
T 56800 49400 5 10 0 0 90 0 1
footprint=DIOM_SMAFN.lht
}
N 56600 51200 56600 52100 4
N 59200 47400 59200 46400 4
C 60100 45200 1 90 0 capacitor-variable-1.sym
{
T 59400 45400 5 10 0 0 90 0 1
device=TZC3Z300A110
T 59800 45900 5 10 1 1 180 0 1
refdes=C15
T 59200 45400 5 10 0 0 90 0 1
symversion=0.1
T 60000 45300 5 10 1 1 0 0 1
value=30pF
T 60100 45200 5 10 0 0 0 0 1
footprint=CAP_VAR3040N.lht
}
C 61700 41600 1 90 0 resistor-1.sym
{
T 61300 41900 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 61500 41500 5 10 1 1 90 0 1
refdes=R95
T 61800 42400 5 10 1 1 90 0 1
value=22
T 61700 41600 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 61700 41600 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
N 61600 41600 61600 40700 4
N 63100 40700 61600 40700 4
N 63100 41600 63100 40700 4
N 62800 41600 62800 40700 4
N 63100 42500 63100 44400 4
N 62200 42500 62200 43200 4
N 62800 42500 62800 43200 4
N 62500 42500 62500 43200 4
N 62500 41600 62500 40700 4
N 62200 41600 62200 40700 4
N 61900 42500 61900 43200 4
N 61900 41600 61900 40700 4
N 61600 42500 61600 43200 4
N 59900 46400 59900 46100 4
N 59900 45200 59900 44700 4
T 61600 39200 9 12 1 0 0 0 4
Current sense R's
paralleled so they 
will not likely go 
open circuit.
N 59200 43800 60600 43800 4
{
T 59200 43900 5 10 1 1 0 0 1
netname=PA5_ADC1.5_current_sense
}
T 61200 45900 9 12 1 0 0 0 2
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
N 60800 45200 60800 44700 4
C 61000 45200 1 90 0 capacitor-variable-1.sym
{
T 60700 45900 5 10 1 1 180 0 1
refdes=C16
T 60900 45300 5 10 1 1 0 0 1
value=6pF
T 60300 45400 5 10 0 0 90 0 1
device=TZC3Z060A110
T 60100 45400 5 10 0 0 90 0 1
symversion=0.1
T 61000 45200 5 10 0 0 0 0 1
footprint=CAP_VAR3040N.lht
}
N 60800 46400 60800 46100 4
T 42700 38700 9 14 1 0 0 0 1
Lockout when cover open
T 43400 38300 9 14 1 0 0 0 1
wires to dual normally open limit switch
C 62000 41600 1 90 0 resistor-1.sym
{
T 61600 41900 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 61800 41500 5 10 1 1 90 0 1
refdes=R94
T 62100 42400 5 10 1 1 90 0 1
value=22
T 62000 41600 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 62000 41600 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
C 62300 41600 1 90 0 resistor-1.sym
{
T 61900 41900 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 62100 41500 5 10 1 1 90 0 1
refdes=R93
T 62400 42400 5 10 1 1 90 0 1
value=22
T 62300 41600 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 62300 41600 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
C 62600 41600 1 90 0 resistor-1.sym
{
T 62200 41900 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 62400 41500 5 10 1 1 90 0 1
refdes=R92
T 62700 42400 5 10 1 1 90 0 1
value=22
T 62600 41600 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 62600 41600 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
C 62900 41600 1 90 0 resistor-1.sym
{
T 62500 41900 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 62700 41500 5 10 1 1 90 0 1
refdes=R91
T 63000 42400 5 10 1 1 90 0 1
value=22
T 62900 41600 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 62900 41600 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
C 63200 41600 1 90 0 resistor-1.sym
{
T 62800 41900 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 63000 41500 5 10 1 1 90 0 1
refdes=R90
T 63300 42400 5 10 1 1 90 0 1
value=22
T 63200 41600 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 63200 41600 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
C 56200 38600 1 90 0 ffc-zif-6.sym
{
T 56400 39100 5 10 1 1 180 0 1
refdes=J4
T 56200 38600 5 10 0 0 0 0 1
footprint=ffc_zif_06_1.25.lht
T 56200 38600 5 10 0 0 0 0 1
device=FC5030-06
T 56200 38600 5 10 0 0 0 0 1
value=conn
}
N 55300 41700 55300 39900 4
{
T 55250 40900 5 10 1 1 90 6 1
netname=PULL_OFF
}
C 59200 44400 1 0 0 vss.sym
C 49200 53400 1 0 0 vss.sym
C 58200 45200 1 90 0 resistor-1.sym
{
T 57800 45500 5 10 0 0 90 0 1
device=R_9.10k_1%_1608
T 57900 45500 5 10 1 1 90 0 1
refdes=R30
T 58400 45600 5 10 1 1 90 0 1
value=9.10K
T 58200 45200 5 10 0 0 0 0 1
description=9.10k  ±1% 1608
T 58200 45200 5 10 0 0 0 0 1
footprint=RESC1608N.lht
}
C 59000 45200 1 90 0 resistor-1.sym
{
T 58600 45500 5 10 0 0 90 0 1
device=R_9.10k_1%_1608
T 58700 45400 5 10 1 1 90 0 1
refdes=R31
T 59200 45600 5 10 1 1 90 0 1
value=9.10K
T 59000 45200 5 10 0 0 0 0 1
description=9.10k  ±1% 1608
T 59000 45200 5 10 0 0 0 0 1
footprint=RESC1608N.lht
}
N 58100 45200 58100 44700 4
N 58100 46100 58100 46400 4
N 58900 46100 58900 46400 4
C 51200 52700 1 0 0 schottky.sym
{
T 51500 52400 5 10 1 1 0 0 1
device=B5819WS
T 51900 52600 5 10 1 1 0 0 1
refdes=D5
T 51500 52200 5 10 1 1 0 0 1
value=.9V .5W
T 51400 52650 5 10 0 1 270 0 1
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
refdes=J3
T 64050 51900 5 10 0 0 0 0 1
value=conn
}
C 51500 54200 1 270 0 NFET_enh_TSOT-26.sym
{
T 51100 53400 5 10 1 1 0 0 1
device=DMN4060SVT
T 52350 53900 5 10 1 1 0 0 1
refdes=Q11
T 51500 54200 5 10 0 0 270 0 1
description=MOSFET N-CH 45V 4.8A TSOT-26
T 51500 54200 5 10 0 0 270 0 1
footprint=TSOT-26N.lht
T 51500 54200 5 10 0 0 0 0 1
value=NFET
T 51200 53200 5 10 1 1 0 0 1
comment=TSOT-26-6
}
N 53200 53500 52700 53500 4
N 53200 53300 52700 53300 4
C 51500 48600 1 270 1 NFET_enh_TSOT-26.sym
{
T 52300 49300 5 10 1 1 0 6 1
device=DMN4060SVT
T 52750 48800 5 10 1 1 0 6 1
refdes=Q12
T 51500 48600 5 10 0 0 270 6 1
description=MOSFET N-CH 45V 4.8A TSOT-26
T 51500 48600 5 10 0 0 270 6 1
footprint=TSOT-26N.lht
T 51500 48600 5 10 0 0 0 0 1
value=NFET
T 51200 49500 5 10 1 1 0 0 1
comment=TSOT-26-6
}
N 52700 49100 53200 49100 4
N 52700 49500 53200 49500 4
N 52700 49700 53500 49700 4
N 52700 49300 53200 49300 4
N 53100 48300 53500 48300 4
N 53500 50700 54000 50700 4
N 52700 53100 53200 53100 4
C 57400 52900 1 0 0 diode-1.sym
{
T 57800 53500 5 10 0 0 0 0 1
device=R3000
T 57700 53500 5 10 1 1 0 0 1
refdes=D1
T 57700 52700 5 10 1 1 0 0 1
value=3KV
T 57400 52900 5 10 0 0 0 0 1
description=diode rect 3000V 0.5A DO-41
T 57400 52900 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
N 57400 53100 57000 53100 4
N 57000 53100 57000 52100 4
N 59200 53100 59200 52100 4
N 57500 51300 57500 51200 4
N 57500 51300 56600 51300 4
N 57500 49400 57500 48900 4
N 38800 49900 45200 49900 4
{
T 42050 50100 5 11 1 1 180 6 1
netname=ONBOARD_18V
}
C 49700 51800 1 90 0 capacitor-2.sym
{
T 49000 52000 5 10 0 0 90 0 1
device=VZH471M1ETR-1010
T 48800 52000 5 10 0 0 90 0 1
symversion=0.1
T 49700 51800 5 10 0 0 180 0 1
description=CAP ALUM 470UF 20% 25V 105C SMD
T 49700 51800 5 10 0 0 180 0 1
footprint=CAPAE10X10.lht
T 49800 52600 5 10 1 1 180 0 1
refdes=C8
T 49300 51500 5 10 1 1 90 0 1
value=470 uF
}
N 41600 48800 41600 49900 4
L 55200 50400 55800 50400 3 10 1 0 -1 -1
L 55800 50000 55800 50400 3 10 1 0 -1 -1
N 56000 50700 55500 50700 4
L 55000 52800 55200 52900 3 10 1 0 -1 -1
L 55000 53100 55200 52900 3 10 1 0 -1 -1
L 55000 53100 55000 52800 3 10 1 0 -1 -1
N 55600 39900 55600 41700 4
{
T 55500 41650 5 11 1 1 90 6 1
netname=ONBOARD_18V
}
C 49400 48800 1 0 1 vss.sym
N 53500 47200 53500 50700 4
{
T 53450 50100 5 10 1 1 90 0 1
netname=PUSH
}
N 53500 52100 53500 55500 4
{
T 53450 53600 5 10 1 1 90 0 1
netname=PULL
}
N 50900 51400 50900 51800 4
C 57000 48600 1 0 0 vss.sym
C 60600 43100 1 0 0 EMBEDDEDresistor-1.sym
[
L 61200 43300 61100 43100 3 0 0 0 -1 -1
L 61100 43100 61000 43300 3 0 0 0 -1 -1
L 61000 43300 60900 43100 3 0 0 0 -1 -1
L 60900 43100 60800 43300 3 0 0 0 -1 -1
L 61200 43300 61300 43100 3 0 0 0 -1 -1
L 61300 43100 61350 43200 3 0 0 0 -1 -1
P 61500 43200 61350 43200 1 0 0
{
T 61400 43250 5 8 0 1 0 0 1
pinnumber=2
T 61400 43250 5 8 0 0 0 0 1
pinseq=2
T 61400 43250 5 8 0 1 0 0 1
pinlabel=2
T 61400 43250 5 8 0 1 0 0 1
pintype=pas
}
P 60600 43200 60752 43200 1 0 0
{
T 60700 43250 5 8 0 1 0 0 1
pinnumber=1
T 60700 43250 5 8 0 0 0 0 1
pinseq=1
T 60700 43250 5 8 0 1 0 0 1
pinlabel=1
T 60700 43250 5 8 0 1 0 0 1
pintype=pas
}
L 60801 43300 60750 43200 3 0 0 0 -1 -1
T 60900 43500 5 10 0 0 0 0 1
device=RESISTOR
T 60800 43400 8 10 0 1 0 0 1
refdes=R?
T 60600 43100 8 10 0 1 0 0 1
pins=2
T 60600 43100 8 10 0 1 0 0 1
class=DISCRETE
]
{
T 60900 43500 5 10 0 0 0 0 1
device=R_133_1%_2013
T 60600 43100 5 10 0 0 180 0 1
footprint=RESC2013N.lht
T 61300 43000 5 10 1 1 180 0 1
refdes=R96
T 61000 43500 5 10 1 1 180 0 1
value=133
}
N 50200 52700 50200 52900 4
N 50200 51400 50200 51800 4
N 50300 50200 50300 49900 4
N 49600 51400 49600 51100 4
N 50300 51100 50300 51400 4
T 49600 54000 9 12 1 0 0 0 2
alt. transistors
use only one.
N 50900 52700 50900 52900 4
N 51000 51100 51000 51400 4
N 51000 50200 51000 49900 4
N 61500 43200 63100 43200 4
{
T 62400 43250 5 10 1 1 0 0 1
netname=LOW_SIDE
}
C 62300 40400 1 0 0 vss.sym
N 57500 46400 60800 46400 4
N 63100 44400 63300 44400 4
L 58500 49100 58500 49500 3 10 1 0 -1 -1
C 56600 46300 1 0 0 EMBEDDEDresistor-1.sym
[
L 57200 46500 57100 46300 3 0 0 0 -1 -1
L 57100 46300 57000 46500 3 0 0 0 -1 -1
L 57000 46500 56900 46300 3 0 0 0 -1 -1
L 56900 46300 56800 46500 3 0 0 0 -1 -1
L 57200 46500 57300 46300 3 0 0 0 -1 -1
L 57300 46300 57350 46400 3 0 0 0 -1 -1
P 57500 46400 57350 46400 1 0 0
{
T 57400 46450 5 8 0 1 0 0 1
pinnumber=2
T 57400 46450 5 8 0 0 0 0 1
pinseq=2
T 57400 46450 5 8 0 1 0 0 1
pinlabel=2
T 57400 46450 5 8 0 1 0 0 1
pintype=pas
}
P 56600 46400 56752 46400 1 0 0
{
T 56700 46450 5 8 0 1 0 0 1
pinnumber=1
T 56700 46450 5 8 0 0 0 0 1
pinseq=1
T 56700 46450 5 8 0 1 0 0 1
pinlabel=1
T 56700 46450 5 8 0 1 0 0 1
pintype=pas
}
L 56801 46500 56750 46400 3 0 0 0 -1 -1
T 56900 46700 5 10 0 0 0 0 1
device=RESISTOR
T 56800 46600 8 10 0 1 0 0 1
refdes=R?
T 56600 46300 8 10 0 1 0 0 1
pins=2
T 56600 46300 8 10 0 1 0 0 1
class=DISCRETE
]
{
T 56900 46700 5 10 0 0 0 0 1
device=R_133_1%_2013
T 56600 46300 5 10 0 0 180 0 1
footprint=RESC2013N.lht
T 57300 46200 5 10 1 1 180 0 1
refdes=R27
T 57000 46700 5 10 1 1 180 0 1
value=133
}
N 56600 46400 56400 46400 4
N 56400 46400 56400 45600 4
N 38900 47000 40400 47000 4
{
T 39000 47150 5 10 1 1 180 6 1
netname=N_PA2
}
C 56800 50300 1 90 0 diode-1.sym
{
T 56200 50700 5 10 0 0 90 0 1
device=S1Y
T 56200 51000 5 10 1 1 0 0 1
refdes=D9
T 56900 50600 5 10 1 1 0 0 1
value=2KV
T 56800 50300 5 10 0 0 90 0 1
description=diode rect 2000V 1A SMAF
T 56800 50300 5 10 0 0 90 0 1
footprint=DIOM_SMAFN.lht
}
C 54200 39600 1 0 1 vss.sym
N 55000 39900 54100 39900 4
C 39100 58100 1 180 1 ffc-zif-20.sym
{
T 40607 53654 5 10 0 0 180 6 1
symversion=0.2
T 40542 53508 5 10 0 1 180 6 1
device=FC5030-20
T 39100 58100 5 10 0 0 0 0 1
value=conn
T 39100 58100 5 10 0 0 0 0 1
footprint=ffc_zif_20_1.25.lht
T 39200 51100 5 10 1 1 180 6 1
refdes=J1
}
N 40400 54000 41400 54000 4
{
T 41100 54145 5 10 1 1 180 3 1
netname=VSS
}
N 40400 55200 41400 55200 4
{
T 41100 55345 5 10 1 1 180 3 1
netname=VSS
}
N 40400 56700 42600 56700 4
{
T 40950 56900 5 11 1 1 180 6 1
netname=ONBOARD_18V
}
N 40400 55800 41400 55800 4
{
T 41100 55945 5 10 1 1 180 3 1
netname=VSS
}
N 40400 52200 43000 52200 4
{
T 42800 52400 5 10 1 1 180 0 1
netname=PA5_ADC1.5_current_sense
}
N 40400 57000 41700 57000 4
{
T 40800 57150 5 10 1 1 180 6 1
netname=HV_sense
}
N 40400 53100 41400 53100 4
{
T 41100 53245 5 10 1 1 180 3 1
netname=VSS
}
N 40400 51900 40800 51900 4
N 40400 55500 40800 55500 4
N 40400 52500 41400 52500 4
{
T 41100 52645 5 10 1 1 180 3 1
netname=VSS
}
N 40400 52800 42100 52800 4
{
T 40700 52950 5 10 1 1 180 6 1
netname=N_PA2
}
N 40400 53700 42100 53700 4
{
T 40700 53850 5 10 1 1 180 6 1
netname=N_PA1
}
C 40800 51800 1 0 0 nc-right-1.sym
{
T 40900 52300 5 10 0 0 0 0 1
value=NoConnection
T 40900 52500 5 10 0 0 0 0 1
device=DRC_Directive
}
C 40800 55400 1 0 0 nc-right-1.sym
{
T 40900 55900 5 10 0 0 0 0 1
value=NoConnection
T 40900 56100 5 10 0 0 0 0 1
device=DRC_Directive
}
N 40400 51600 41400 51600 4
{
T 41100 51745 5 10 1 1 180 3 1
netname=VSS
}
N 40400 57300 41400 57300 4
{
T 41100 57445 5 10 1 1 180 3 1
netname=VSS
}
N 40400 56100 41400 56100 4
{
T 41100 56245 5 10 1 1 180 3 1
netname=VSS
}
N 40400 54300 41400 54300 4
{
T 41100 54445 5 10 1 1 180 3 1
netname=VSS
}
N 40400 53400 41400 53400 4
{
T 41100 53545 5 10 1 1 180 3 1
netname=VSS
}
N 40400 56400 42600 56400 4
{
T 40950 56600 5 11 1 1 180 6 1
netname=ONBOARD_18V
}
N 40100 57900 40500 57900 4
N 40500 57900 40500 57300 4
N 40500 51600 40500 51000 4
N 40500 51000 40100 51000 4
C 40800 54800 1 0 0 nc-right-1.sym
{
T 40900 55300 5 10 0 0 0 0 1
value=NoConnection
T 40900 55500 5 10 0 0 0 0 1
device=DRC_Directive
}
N 40400 54900 40800 54900 4
C 40800 54500 1 0 0 nc-right-1.sym
{
T 40900 55000 5 10 0 0 0 0 1
value=NoConnection
T 40900 55200 5 10 0 0 0 0 1
device=DRC_Directive
}
N 40400 54600 40800 54600 4
N 49500 52700 49500 52900 4
N 49600 50200 49600 49900 4
N 44500 47600 44800 47600 4
N 44800 47600 44800 49900 4
N 40800 48200 41600 48200 4
N 45200 47000 41300 47000 4
C 40400 46900 1 0 0 resistor-1.sym
{
T 40700 47300 5 10 0 0 0 0 1
device=R_4.7R_1%_1608
T 40400 47200 5 10 1 1 0 0 1
refdes=R18
T 40900 46700 5 10 1 1 0 0 1
value=22k
T 40400 46900 5 10 0 0 270 0 1
description=Res thick 4.70k 1% 1608
T 40400 46900 5 10 0 0 270 0 1
footprint=RESC1608N.lht
}
C 40900 49500 1 270 0 EMBEDDEDresistor-1.sym
[
L 41100 48900 40900 49000 3 0 0 0 -1 -1
L 40900 49000 41100 49100 3 0 0 0 -1 -1
L 41100 49100 40900 49200 3 0 0 0 -1 -1
L 40900 49200 41100 49300 3 0 0 0 -1 -1
L 41100 48900 40900 48800 3 0 0 0 -1 -1
L 40900 48800 41000 48750 3 0 0 0 -1 -1
P 41000 48600 41000 48750 1 0 0
{
T 41050 48700 5 8 0 1 270 0 1
pinnumber=2
T 41050 48700 5 8 0 0 270 0 1
pinseq=2
T 41050 48700 5 8 0 1 270 0 1
pinlabel=2
T 41050 48700 5 8 0 1 270 0 1
pintype=pas
}
P 41000 49500 41000 49348 1 0 0
{
T 41050 49400 5 8 0 1 270 0 1
pinnumber=1
T 41050 49400 5 8 0 0 270 0 1
pinseq=1
T 41050 49400 5 8 0 1 270 0 1
pinlabel=1
T 41050 49400 5 8 0 1 270 0 1
pintype=pas
}
L 41100 49299 41000 49350 3 0 0 0 -1 -1
T 41300 49200 5 10 0 0 270 0 1
device=RESISTOR
T 41200 49300 8 10 0 1 270 0 1
refdes=R?
T 40900 49500 8 10 0 1 270 0 1
pins=2
T 40900 49500 8 10 0 1 270 0 1
class=DISCRETE
]
{
T 41300 49200 5 10 0 0 270 0 1
device=R_1.0k_1%_1608
T 40900 49500 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 40800 48700 5 10 1 1 90 0 1
refdes=R15
T 41300 49200 5 10 1 1 90 0 1
value=1.8k
}
C 45100 49900 1 270 0 EMBEDDEDresistor-1.sym
[
L 45300 49300 45100 49400 3 0 0 0 -1 -1
L 45100 49400 45300 49500 3 0 0 0 -1 -1
L 45300 49500 45100 49600 3 0 0 0 -1 -1
L 45100 49600 45300 49700 3 0 0 0 -1 -1
L 45300 49300 45100 49200 3 0 0 0 -1 -1
L 45100 49200 45200 49150 3 0 0 0 -1 -1
P 45200 49000 45200 49150 1 0 0
{
T 45250 49100 5 8 0 1 270 0 1
pinnumber=2
T 45250 49100 5 8 0 0 270 0 1
pinseq=2
T 45250 49100 5 8 0 1 270 0 1
pinlabel=2
T 45250 49100 5 8 0 1 270 0 1
pintype=pas
}
P 45200 49900 45200 49748 1 0 0
{
T 45250 49800 5 8 0 1 270 0 1
pinnumber=1
T 45250 49800 5 8 0 0 270 0 1
pinseq=1
T 45250 49800 5 8 0 1 270 0 1
pinlabel=1
T 45250 49800 5 8 0 1 270 0 1
pintype=pas
}
L 45300 49699 45200 49750 3 0 0 0 -1 -1
T 45500 49600 5 10 0 0 270 0 1
device=RESISTOR
T 45400 49700 8 10 0 1 270 0 1
refdes=R?
T 45100 49900 8 10 0 1 270 0 1
pins=2
T 45100 49900 8 10 0 1 270 0 1
class=DISCRETE
]
{
T 45500 49600 5 10 0 0 270 0 1
device=R_1.0k_1%_1608
T 45100 49900 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 45000 49200 5 10 1 1 90 0 1
refdes=R16
T 45500 49600 5 10 1 1 90 0 1
value=1.8k
}
T 38900 38400 9 22 1 0 0 0 1
To Do:
T 57300 57600 9 22 1 0 0 0 1
To Do:
T 40300 38200 9 12 1 0 0 0 3
Leave enough 
layout room
to rework transistors.
C 52300 47800 1 270 1 NFET_enh.sym
{
T 52700 47800 5 10 1 1 180 6 1
refdes=Q2
T 52300 47600 5 10 0 1 0 2 1
footprint=PICOSTAR_YJK.lht
T 52300 47800 5 10 0 0 90 2 1
description=MOSFET N-CH 60V 1.7A SOT23
T 52300 47800 5 10 0 0 180 6 1
value=NFET
T 52200 48500 5 10 1 1 180 6 1
comment=femtoFET
}
N 51500 46700 52900 46700 4
{
T 51500 46550 5 10 1 1 0 0 1
netname=PUSH_DRIVE
}
N 50800 56000 52900 56000 4
{
T 52200 56150 5 10 1 1 180 0 1
netname=PULL_DRIVE
}
N 46300 48800 47600 48800 4
{
T 46400 48850 5 10 1 1 0 0 1
netname=PUSH_DRIVE
}
N 44500 48800 45400 48800 4
C 45400 48900 1 180 1 resistor-1.sym
{
T 45700 48500 5 10 0 0 180 6 1
device=R_220_1%_1608
T 46050 48950 5 10 1 1 0 6 1
refdes=R12
T 46050 48550 5 10 1 1 0 6 1
value=51
T 45400 48900 5 10 0 0 90 2 1
description=Res thick 220 1%   
T 45400 48900 5 10 0 0 90 2 1
footprint=RESC1608N.lht
}
N 55900 39900 55900 41700 4
{
T 55650 40000 5 10 1 1 90 2 1
netname=PUSH_OFF
}
N 41600 46600 41600 47600 4
C 51400 46700 1 270 1 resistor-1.sym
{
T 51800 47000 5 10 0 0 90 2 1
device=Res_680_1%_1608
T 51350 47250 5 10 1 1 90 6 1
refdes=R10
T 51400 46700 5 10 0 1 270 2 1
footprint=RESC1608N.lht
T 51750 47450 5 10 1 1 90 6 1
value=680
T 51400 46700 5 10 0 0 270 2 1
description=Res thick 680 Ohm 1%
}
C 51400 55100 1 270 1 resistor-1.sym
{
T 51800 55400 5 10 0 0 90 2 1
device=Res_680_1%_1608
T 51350 55650 5 10 1 1 90 6 1
refdes=R11
T 51400 55100 5 10 0 1 270 2 1
footprint=RESC1608N.lht
T 51750 55850 5 10 1 1 90 6 1
value=680
T 51400 55100 5 10 0 0 270 2 1
description=Res thick 680 Ohm 1%
}
T 56900 55200 9 12 1 0 0 0 2
LFPAK/DPAK 
transistors close.
C 41700 41900 1 0 0 NPN-NPN-BRT-so6.sym
{
T 42300 43750 5 14 1 1 0 3 1
refdes=U4
T 42700 43800 5 10 1 1 0 0 1
device=MUN5232DW1T1G
T 42800 41900 5 10 1 1 0 0 1
footprint=SOT363M.lht
T 41700 41900 5 10 0 0 0 0 1
value=BRT NPN dual
}
C 42400 44400 1 180 0 resistor-1.sym
{
T 42100 44000 5 10 0 0 0 8 1
device=R_22.0_1%_1608
T 41500 44500 5 10 1 1 0 0 1
refdes=R53
T 42000 44000 5 10 1 1 0 0 1
value=22
T 42400 44400 5 10 0 0 0 8 1
footprint=RESC1608N.lht
T 42400 44400 5 10 0 0 0 8 1
description=Res thick 22.0 1% 1608
}
N 42400 44300 43500 44300 4
{
T 43400 44350 5 10 1 1 0 6 1
netname=PUSH_OFF
}
T 49600 54600 9 12 1 0 0 0 4
femtoFET may 
not repair well 
and so switch to 
DMN4060SVT
N 38900 44300 39600 44300 4
{
T 39000 44450 5 10 1 1 180 6 1
netname=N_PA1
}
C 40500 44200 1 0 1 resistor-1.sym
{
T 40200 44600 5 10 0 0 180 2 1
device=Res_2.20k_1%_1608
T 39950 44150 5 10 1 1 180 6 1
refdes=R51
T 40500 44200 5 10 0 1 0 2 1
footprint=RESC1608N.lht
T 39750 44550 5 10 1 1 180 6 1
value=2.20k
T 40500 44200 5 10 0 0 0 2 1
description=Res thick 2.20k Ohm 1%
}
N 45500 44500 45500 43400 4
N 45500 43400 44600 43400 4
N 41700 43400 41400 43400 4
C 41500 43100 1 0 1 vss.sym
N 44900 42200 44600 42200 4
C 45000 41900 1 0 1 vss.sym
N 41100 41500 41100 42200 4
N 41100 42200 41700 42200 4
N 41700 42800 40800 42800 4
N 40800 42800 40800 44300 4
C 45500 44600 1 180 1 resistor-1.sym
{
T 45800 44200 5 10 0 0 180 6 1
device=R_220_1%_1608
T 45950 44750 5 10 1 1 0 6 1
refdes=R52
T 46250 44150 5 10 1 1 0 6 1
value=220
T 45500 44600 5 10 0 0 90 2 1
description=Res thick 220 1%   
T 45500 44600 5 10 0 0 90 2 1
footprint=RESC1608N.lht
}
N 40500 44300 41500 44300 4
N 46400 42800 44600 42800 4
N 46900 41500 45500 41500 4
{
T 46800 41550 5 10 1 1 0 6 1
netname=PULL_DRIVE
}
C 44600 41600 1 180 1 resistor-1.sym
{
T 44900 41200 5 10 0 0 180 6 1
device=R_220_1%_1608
T 44750 41650 5 10 1 1 0 0 1
refdes=R42
T 45350 41150 5 10 1 1 0 6 1
value=220
T 44600 41600 5 10 0 0 90 2 1
description=Res thick 220 1%   
T 44600 41600 5 10 0 0 90 2 1
footprint=RESC1608N.lht
}
N 41100 41500 44600 41500 4
N 38900 45100 39600 45100 4
{
T 39000 45250 5 10 1 1 180 6 1
netname=N_PA2
}
C 40500 45000 1 0 1 resistor-1.sym
{
T 40200 45400 5 10 0 0 180 2 1
device=Res_2.20k_1%_1608
T 40500 45000 5 10 0 1 0 2 1
footprint=RESC1608N.lht
T 40500 45000 5 10 0 0 0 2 1
description=Res thick 2.20k Ohm 1%
T 39950 44950 5 10 1 1 180 6 1
refdes=R41
T 39750 45350 5 10 1 1 180 6 1
value=2.20k
}
N 46400 44500 47800 44500 4
{
T 46500 44550 5 10 1 1 0 0 1
netname=PUSH_DRIVE
}
C 47300 42900 1 180 0 resistor-1.sym
{
T 47000 42500 5 10 0 0 0 8 1
device=R_22.0_1%_1608
T 46400 43000 5 10 1 1 0 0 1
refdes=R43
T 46900 42400 5 10 1 1 0 0 1
value=22
T 47300 42900 5 10 0 0 0 8 1
footprint=RESC1608N.lht
T 47300 42900 5 10 0 0 0 8 1
description=Res thick 22.0 1% 1608
}
N 47300 42800 48500 42800 4
{
T 48400 42850 5 10 1 1 0 6 1
netname=PULL_OFF
}
N 60600 43200 60600 43800 4
C 40800 48100 1 0 1 resistor-1.sym
{
T 40500 48500 5 10 0 0 180 2 1
device=R_4.7R_1%_1608
T 40300 48400 5 10 1 1 180 2 1
refdes=R19
T 40600 47900 5 10 1 1 180 2 1
value=22K
T 40800 48100 5 10 0 0 90 6 1
description=Res thick 4.70k 1% 1608
T 40800 48100 5 10 0 0 90 6 1
footprint=RESC1608N.lht
}
N 39900 48200 38800 48200 4
{
T 39400 48350 5 10 1 1 0 8 1
netname=N_PA1
}
C 42000 46500 1 0 0 resistor-1.sym
{
T 42300 46900 5 10 0 0 0 0 1
device=R_220_1%_1608
T 42350 46850 5 10 1 1 180 0 1
refdes=R13
T 42550 46450 5 10 1 1 180 0 1
value=51
T 42000 46500 5 10 0 0 270 0 1
description=Res thick 220 1%   
T 42000 46500 5 10 0 0 270 0 1
footprint=RESC1608N.lht
}
N 42900 46600 46200 46600 4
{
T 45500 46650 5 10 1 1 0 0 1
netname=PULL_DRIVE
}
C 49800 51100 1 90 1 capacitor-2.sym
{
T 49100 50900 5 10 0 0 270 2 1
device=VZH471M1ETR-1010
T 48900 50900 5 10 0 0 270 2 1
symversion=0.1
T 49800 51100 5 10 0 0 0 6 1
description=CAP ALUM 470UF 20% 25V 105C SMD
T 49800 51100 5 10 0 0 0 6 1
footprint=CAPAE10X10.lht
T 49900 50300 5 10 1 1 0 6 1
refdes=C7
T 49300 50900 5 10 1 1 90 2 1
value=470 uF
}
C 50700 52700 1 270 0 capacitor-1.sym
{
T 51400 52500 5 10 0 0 270 0 1
device=CL31A106MBHNNNE
T 51600 52500 5 10 0 0 270 0 1
symversion=0.1
T 50700 52700 5 10 0 0 0 0 1
description=CAP CER 10UF 50V X5R 1206 
T 50700 52700 5 10 0 0 0 0 1
footprint=CAPC3216N.lht
T 50800 51800 5 10 1 1 90 0 1
refdes=C11
T 51100 52400 5 10 1 1 90 0 1
value=10 uF
T 50500 52600 5 10 0 1 0 0 1
comment=X5R
}
C 50800 51100 1 270 0 capacitor-1.sym
{
T 51500 50900 5 10 0 0 270 0 1
device=CL31A106MBHNNNE
T 51700 50900 5 10 0 0 270 0 1
symversion=0.1
T 50800 51100 5 10 0 0 0 0 1
description=CAP CER 10UF 50V X5R 1206 
T 50800 51100 5 10 0 0 0 0 1
footprint=CAPC3216N.lht
T 50900 50200 5 10 1 1 90 0 1
refdes=C12
T 51200 50800 5 10 1 1 90 0 1
value=10 uF
T 50600 51000 5 10 0 1 0 0 1
comment=X5R
}
C 50500 51100 1 90 1 capacitor-2.sym
{
T 49800 50900 5 10 0 0 270 2 1
device=VZH471M1ETR-1010
T 49600 50900 5 10 0 0 270 2 1
symversion=0.1
T 50500 51100 5 10 0 0 0 6 1
description=CAP ALUM 470UF 20% 25V 105C SMD
T 50500 51100 5 10 0 0 0 6 1
footprint=CAPAE10X10.lht
T 50600 50300 5 10 1 1 0 6 1
refdes=C9
T 50000 50900 5 10 1 1 90 2 1
value=470 uF
}
C 50400 51800 1 90 0 capacitor-2.sym
{
T 49700 52000 5 10 0 0 90 0 1
device=VZH471M1ETR-1010
T 49500 52000 5 10 0 0 90 0 1
symversion=0.1
T 50400 51800 5 10 0 0 180 0 1
description=CAP ALUM 470UF 20% 25V 105C SMD
T 50400 51800 5 10 0 0 180 0 1
footprint=CAPAE10X10.lht
T 50500 52600 5 10 1 1 180 0 1
refdes=C10
T 50000 51500 5 10 1 1 90 0 1
value=470 uF
}
C 52700 56000 1 270 0 NFET_enh.sym
{
T 53100 55900 5 10 1 1 0 0 1
refdes=Q1
T 52700 56000 5 10 0 0 270 0 1
footprint=PICOSTAR_YJK.lht
T 52700 56000 5 10 0 0 270 0 1
description=MOSFET N-CH 60V 1.7A SOT23
T 52700 56000 5 10 0 0 0 0 1
value=NFET
T 52800 56100 5 10 1 1 0 0 1
comment=femtoFET
}
N 52700 55500 52200 55500 4
N 52200 55500 52200 54500 4
C 52700 46700 1 270 1 NFET_enh_DPAK.sym
{
T 53300 47300 5 10 1 1 180 2 1
comment=DPAK
T 53500 47500 5 10 1 1 180 2 1
device=CS25N06B4
T 53500 46700 5 10 1 1 180 2 1
refdes=Q22
T 52700 46700 5 10 0 1 0 0 1
description=NFET 60V 33A DPAK
T 52700 46700 5 10 0 0 0 0 1
value=NFET
T 52700 46700 5 10 0 1 0 0 1
footprint=DPAK1.lht
}
N 52700 47200 52300 47200 4
N 52300 47200 52300 48300 4
C 49000 51800 1 90 0 capacitor-2.sym
{
T 48300 52000 5 10 0 0 90 0 1
device=VZH471M1ETR-1010
T 48100 52000 5 10 0 0 90 0 1
symversion=0.1
T 49000 51800 5 10 0 0 180 0 1
description=CAP ALUM 470UF 20% 25V 105C SMD
T 49000 51800 5 10 0 0 180 0 1
footprint=CAPAE10X10.lht
T 49100 52600 5 10 1 1 180 0 1
refdes=C6
T 48600 51500 5 10 1 1 90 0 1
value=470 uF
}
N 48800 52900 48800 52700 4
N 48800 51400 48800 51800 4
C 49100 51100 1 90 1 capacitor-2.sym
{
T 48400 50900 5 10 0 0 270 2 1
device=VZH471M1ETR-1010
T 48200 50900 5 10 0 0 270 2 1
symversion=0.1
T 49100 51100 5 10 0 0 0 6 1
description=CAP ALUM 470UF 20% 25V 105C SMD
T 49100 51100 5 10 0 0 0 6 1
footprint=CAPAE10X10.lht
T 49200 50300 5 10 1 1 0 6 1
refdes=C5
T 48600 50900 5 10 1 1 90 2 1
value=470 uF
}
N 48900 49900 48900 50200 4
N 49900 49900 49900 49100 4
N 49900 52900 49900 53700 4
N 48900 51100 48900 51400 4
N 49500 51800 49500 51400 4
N 55600 52100 55500 52100 4
C 52300 55000 1 270 0 NFET_enh_DPAK.sym
{
T 52900 54200 5 10 1 1 0 8 1
comment=DPAK
T 53700 55000 5 10 1 1 0 8 1
device=CS25N06B4
T 52900 54400 5 10 1 1 0 8 1
refdes=Q21
T 52300 55000 5 10 0 1 180 6 1
description=NFET 60V 33A DPAK
T 52300 55000 5 10 0 0 180 6 1
value=NFET
T 52300 55000 5 10 0 1 180 6 1
footprint=DPAK1.lht
}
C 58300 52900 1 0 0 diode-1.sym
{
T 58700 53500 5 10 0 0 0 0 1
device=R3000
T 58600 53500 5 10 1 1 0 0 1
refdes=D2
T 58600 52700 5 10 1 1 0 0 1
value=3KV
T 58300 52900 5 10 0 0 0 0 1
description=diode rect 3000V 0.5A DO-41
T 58300 52900 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
C 57700 49400 1 90 0 diode-1.sym
{
T 57100 49800 5 10 0 0 90 0 1
device=R3000
T 57400 50200 5 10 1 1 180 0 1
refdes=D8
T 58100 49800 5 10 1 1 180 0 1
value=3KV
T 57700 49400 5 10 0 0 90 0 1
description=diode rect 3000V 0.5A DO-41
T 57700 49400 5 10 0 0 90 0 1
footprint=diode_10mm.fp
}
C 57700 50300 1 90 0 diode-1.sym
{
T 57100 50700 5 10 0 0 90 0 1
device=R3000
T 57400 51100 5 10 1 1 180 0 1
refdes=D10
T 58100 50600 5 10 1 1 180 0 1
value=3KV
T 57700 50300 5 10 0 0 90 0 1
description=diode rect 3000V 0.5A DO-41
T 57700 50300 5 10 0 0 90 0 1
footprint=diode_10mm.fp
}
N 41600 46600 42000 46600 4
C 41600 47300 1 0 0 PNP-PNP-BRT-so6.sym
{
T 42200 49150 5 14 1 1 0 3 1
refdes=U1
T 42600 49200 5 10 1 1 0 0 1
device=BC857BDW1T1
}
N 40500 45100 45000 45100 4
N 45000 45100 45000 42800 4
T 39200 49200 9 12 1 0 0 0 2
3.4k 
res
T 39500 47400 9 12 1 0 0 0 2
3.4k 
res
L 39700 47900 40100 49900 3 10 1 0 -1 -1
L 39400 49100 39500 48200 3 10 1 0 -1 -1
L 39400 49700 39400 49900 3 10 1 0 -1 -1
L 39700 47300 39700 47000 3 10 1 0 -1 -1
T 39000 50100 9 12 1 0 0 0 1
add Rs:
