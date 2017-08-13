v 20170226 2
N 59300 52800 60300 52800 4
{
T 59800 52900 5 10 1 1 0 0 1
netname=doubler_out
}
C 58400 52600 1 0 0 diode-1.sym
{
T 58800 53200 5 10 0 0 0 0 1
device=R3000-TP
T 59000 53200 5 10 1 1 180 0 1
refdes=D1
T 59300 52500 5 10 1 1 180 0 1
value=3KV
T 58400 52600 5 10 0 0 0 0 1
description=DIODE GEN PURP 3KV 200MA DO15 
T 58400 52600 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
C 60100 51600 1 270 0 capacitor-1.sym
{
T 60800 51400 5 10 0 0 270 0 1
device=472-3KV
T 60500 51300 5 10 1 1 0 0 1
refdes=C3
T 61000 51400 5 10 0 0 270 0 1
symversion=0.1
T 59800 50900 5 10 1 1 0 0 1
value=4.7nF
T 60100 51600 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat.fp
}
C 56800 52600 1 0 0 capacitor-1.sym
{
T 57000 53300 5 10 0 0 0 0 1
device=472-3KV
T 57300 53200 5 10 1 1 180 0 1
refdes=C1
T 57000 53500 5 10 0 0 0 0 1
symversion=0.1
T 57600 52500 5 10 1 1 180 0 1
value=4.7nF
T 56800 52600 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat.fp
}
N 57700 52800 58400 52800 4
{
T 57900 52900 5 10 1 1 0 0 1
netname=v2
}
N 58100 51900 58100 52800 4
N 58100 49700 58100 51000 4
N 60300 51600 60300 52800 4
C 56900 53500 1 0 0 capacitor-1.sym
{
T 57100 54200 5 10 0 0 0 0 1
device=472-3KV
T 57400 54100 5 10 1 1 180 0 1
refdes=C2
T 57100 54400 5 10 0 0 0 0 1
symversion=0.1
T 57700 53400 5 10 1 1 180 0 1
value=4.7nF
T 56900 53500 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat_flip.fp
}
N 59900 45500 63200 45500 4
N 60300 49700 60300 50700 4
N 60300 52500 63200 52500 4
N 58000 52800 58000 53700 4
N 56900 53700 56700 53700 4
N 56700 53700 56700 52800 4
N 58000 53700 57800 53700 4
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
rev=0.2    2017-8-11
T 64400 43100 5 18 1 1 270 0 1
title2=Culture Shock kvboard PCB
}
C 56000 51300 1 0 1 transformer-epc19.sym
{
T 55850 52900 5 10 1 1 0 6 1
refdes=T1
T 56000 53100 5 10 0 1 0 6 1
device=CS1-HVT-EPC19-03
T 56000 51300 5 10 0 0 0 0 1
description=1500V transformer
T 56000 51300 5 10 0 0 0 0 1
footprint=xfmr_epc19_10.fp
T 56000 51300 5 10 0 0 0 0 1
value=xfmr
}
C 60900 52000 1 0 0 resistor-1.sym
{
T 61200 52400 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61000 52300 5 10 1 1 0 0 1
refdes=R1
T 61300 51800 5 10 1 1 0 0 1
value=475K
T 60900 52000 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 60900 52000 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 62100 52000 1 0 0 resistor-1.sym
{
T 62400 52400 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 62200 52300 5 10 1 1 0 0 1
refdes=R2
T 62500 51800 5 10 1 1 0 0 1
value=475K
T 62100 52000 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 62100 52000 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
N 54500 52400 54500 51800 4
T 58500 44100 9 12 1 0 0 0 3
2500V divided by 800 attenuation = 
3.125V, which is compatible with 
the 3.3V supply to the MCUs ADCs.
N 60900 51300 60900 50500 4
C 61000 45800 1 90 0 resistor-1.sym
{
T 60600 46100 5 10 0 0 90 0 1
device=RC0805FR-074K75L
T 60700 46000 5 10 1 1 90 0 1
refdes=R9
T 61200 46200 5 10 1 1 90 0 1
value=4.75K
T 61000 45800 5 10 0 0 0 0 1
description=4.75k Ohm ±1% 0.125W, 1/8W Chip Resistor 0805 (2012 Metric) 
T 61000 45800 5 10 0 0 0 0 1
footprint=chip_2012_0805_N.fp
}
N 55900 47100 60900 47100 4
C 55900 47200 1 180 0 resistor-1.sym
{
T 55600 46800 5 10 0 0 180 0 1
device=MF-RES-0805-220
T 53600 47400 5 10 1 1 180 0 1
refdes=R14
T 55900 47200 5 10 0 1 0 0 1
footprint=chip_2012_0805_N.fp
T 55500 47300 5 10 1 1 0 0 1
value=220
T 55900 47200 5 10 0 0 0 0 1
description=220 Ohm 1/8 Watt 0805
}
N 55000 47100 43800 47100 4
C 64100 52400 1 0 1 terminal-1.sym
{
T 63790 53150 5 10 0 0 0 6 1
device=terminal
T 63790 53000 5 10 0 0 0 6 1
footprint=spring_coin_contact.fp
T 63850 52450 5 10 1 1 0 0 1
refdes=CT1
T 64100 52400 5 10 0 0 0 0 1
value=connect
}
C 64100 45400 1 0 1 terminal-1.sym
{
T 63790 46150 5 10 0 0 0 6 1
device=terminal
T 63790 46000 5 10 0 0 0 6 1
footprint=spring_coin_contact.fp
T 63850 45450 5 10 1 1 0 0 1
refdes=CT2
T 64100 45400 5 10 0 0 0 0 1
value=connect
}
N 61900 45300 61900 45500 4
N 56000 51400 56000 49700 4
N 56000 49700 60300 49700 4
N 54500 51400 54450 51400 4
N 50650 52800 54500 52800 4
T 62750 52950 9 12 1 0 0 0 2
spring contacts
hold cuvette
T 62750 45950 9 12 1 0 0 0 2
spring contacts
hold cuvette
N 54450 51400 54450 50600 4
N 50050 51150 50050 50600 4
N 50050 49800 50050 48100 4
N 54450 48100 54450 49800 4
C 59400 51900 1 270 0 capacitor-1.sym
{
T 60100 51700 5 10 0 0 270 0 1
device=472-3KV
T 59800 51600 5 10 1 1 0 0 1
refdes=C4
T 60300 51700 5 10 0 0 270 0 1
symversion=0.1
T 59100 51200 5 10 1 1 0 0 1
value=4.7nF
T 59400 51900 5 10 0 0 0 0 1
footprint=disk_cap_5mm_flat_flip.fp
}
N 59600 51900 59600 52800 4
N 59600 49700 59600 51000 4
N 60900 45800 60900 45500 4
L 55300 53900 55300 53300 3 10 1 0 -1 -1
L 55300 54700 55900 54700 3 10 1 0 -1 -1
L 56200 54700 57000 54700 3 10 1 0 -1 -1
L 64300 54700 64300 54000 3 10 1 0 -1 -1
L 64300 49300 63300 49300 3 10 1 0 -1 -1
T 61500 54000 9 22 1 0 0 0 1
HV Zone
L 55300 54700 55300 54200 3 10 1 0 -1 -1
L 58400 54700 59200 54700 3 10 1 0 -1 -1
L 57300 54700 58100 54700 3 10 1 0 -1 -1
L 59500 54700 60300 54700 3 10 1 0 -1 -1
L 60600 54700 61400 54700 3 10 1 0 -1 -1
L 61700 54700 62500 54700 3 10 1 0 -1 -1
L 62800 54700 63600 54700 3 10 1 0 -1 -1
L 63900 54700 64200 54700 3 10 1 0 -1 -1
L 64300 52900 64300 53700 3 10 1 0 -1 -1
L 64300 51800 64300 52600 3 10 1 0 -1 -1
L 64300 50700 64300 51500 3 10 1 0 -1 -1
L 64300 49600 64300 50400 3 10 1 0 -1 -1
L 57900 49300 58700 49300 3 10 1 0 -1 -1
L 59000 49300 59800 49300 3 10 1 0 -1 -1
L 60100 49300 60800 49300 3 10 1 0 -1 -1
L 61100 49300 61900 49300 3 10 1 0 -1 -1
L 62200 49300 63000 49300 3 10 1 0 -1 -1
T 56200 50800 9 22 1 0 0 0 1
HV Zone
L 55300 49300 55300 50000 3 10 1 0 -1 -1
L 55300 50300 55300 51100 3 10 1 0 -1 -1
C 62100 51200 1 0 0 resistor-1.sym
{
T 62400 51600 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 62200 51500 5 10 1 1 0 0 1
refdes=R3
T 62500 51000 5 10 1 1 0 0 1
value=475K
T 62100 51200 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 62100 51200 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 60900 51200 1 0 0 resistor-1.sym
{
T 61200 51600 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61000 51500 5 10 1 1 0 0 1
refdes=R4
T 61300 51000 5 10 1 1 0 0 1
value=475K
T 60900 51200 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 60900 51200 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 60900 50400 1 0 0 resistor-1.sym
{
T 61200 50800 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61000 50700 5 10 1 1 0 0 1
refdes=R5
T 61300 50200 5 10 1 1 0 0 1
value=475K
T 60900 50400 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 60900 50400 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 62100 50400 1 0 0 resistor-1.sym
{
T 62400 50800 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 62200 50700 5 10 1 1 0 0 1
refdes=R6
T 62500 50200 5 10 1 1 0 0 1
value=475K
T 62100 50400 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 62100 50400 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 62100 49600 1 0 0 resistor-1.sym
{
T 62400 50000 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 62200 49900 5 10 1 1 0 0 1
refdes=R7
T 62500 49400 5 10 1 1 0 0 1
value=475K
T 62100 49600 5 10 0 0 0 0 1
footprint=1206_HV.fp
T 62100 49600 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
}
C 60900 49600 1 0 0 resistor-1.sym
{
T 61200 50000 5 10 0 0 0 0 1
device=RC1206FR-07475KL
T 61000 49900 5 10 1 1 0 0 1
refdes=R8
T 61300 49400 5 10 1 1 0 0 1
value=475K
T 60900 49600 5 10 0 0 0 0 1
description=RES SMD 475K OHM 1% 1/4W 1206
T 60900 49600 5 10 0 0 0 0 1
footprint=1206_HV.fp
}
N 60900 46700 60900 49700 4
N 60900 52100 60900 52500 4
N 51850 50000 53950 50000 4
N 47250 50000 49550 50000 4
N 47250 48100 47250 48750 4
N 51850 48100 51850 48750 4
N 47250 49650 47250 50350 4
N 51850 49650 51850 50400 4
C 58300 51000 1 90 0 diode-1.sym
{
T 57700 51400 5 10 0 0 90 0 1
device=R3000-TP
T 57600 51500 5 10 1 1 0 0 1
refdes=D2
T 58700 51500 5 10 1 1 180 0 1
value=3KV
T 58300 51000 5 10 0 0 90 0 1
description=DIODE GEN PURP 3KV 200MA DO15 
T 58300 51000 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
L 56800 49300 57600 49300 3 10 1 0 -1 -1
L 55300 49300 55400 49300 3 10 1 0 -1 -1
L 55700 49300 56500 49300 3 10 1 0 -1 -1
N 62100 52100 61800 52100 4
N 61800 51300 62100 51300 4
N 61800 50500 62100 50500 4
N 61800 49700 62100 49700 4
N 63000 50500 63000 49700 4
N 63000 51300 63000 52100 4
N 59900 49700 59900 45500 4
N 47250 48100 54450 48100 4
{
T 52050 48155 5 10 1 1 0 3 1
netname=com
}
N 43800 47100 43800 50900 4
T 39600 45000 9 12 1 0 0 0 7
ZIF connector pin numbering 
is not connected 1 to 1,
but by FFC cable with same 
side up on both boards.
Connector left pin connects to 
other end connecto right pin 
as a signal goes through FFC cable.
N 56000 52800 56800 52800 4
C 49850 47800 1 0 0 com.sym
C 61800 45000 1 0 0 com.sym
C 49550 49800 1 0 0 nmos-4pad.sym
{
T 50250 50150 5 10 1 1 0 0 1
device=BUK98150-55
T 50250 50350 5 10 1 1 0 0 1
refdes=Q11
T 50250 49950 5 10 1 1 0 0 1
footprint=SOT223_NXP.fp
T 49550 49800 5 10 0 0 0 0 1
description=MOSFET N-CH 55V 5.5A SOT223 enhanced mode
T 49550 49800 5 10 0 0 0 0 1
value=NFET
}
N 50150 50600 50150 51150 4
C 53950 49800 1 0 0 nmos-4pad.sym
{
T 54550 50250 5 10 1 1 0 0 1
device=BUK98150-55
T 54650 50500 5 10 1 1 0 0 1
refdes=Q12
T 54550 50000 5 10 0 1 0 0 1
footprint=SOT223_NXP.fp
T 53950 49800 5 10 0 0 0 0 1
description=MOSFET N-CH 55V 5.5A SOT223 enhanced mode
T 53950 49800 5 10 0 0 0 0 1
value=NFET
}
N 54550 50600 54550 50800 4
N 54550 50800 54450 50800 4
C 39500 53400 1 180 1 ffc-zif-20.sym
{
T 39600 46800 5 10 1 1 180 6 1
refdes=J3
T 39792 50942 5 10 1 1 270 6 1
footprint=ffc_zif_20.fp
T 40942 48808 5 10 0 1 180 6 1
device=zif_connector
T 39500 53400 5 10 0 0 0 0 1
value=connect
T 39500 53400 5 10 0 0 0 0 1
net=common:21
T 39500 53400 5 10 0 0 0 0 1
net=common:22
}
N 40800 47300 42500 47300 4
N 42500 47300 42500 47200 4
N 40800 49700 42300 49700 4
{
T 41800 49755 5 10 1 1 0 3 1
netname=com
}
N 40800 50000 41300 50000 4
N 41300 53000 40800 53000 4
N 41300 52700 41300 53000 4
N 40800 52700 43750 52700 4
{
T 41800 52755 5 10 1 1 0 3 1
netname=com
}
C 42600 46900 1 0 1 com.sym
N 46800 48500 46800 52750 4
C 46450 53000 1 0 0 p-chan-dual-so6.sym
{
T 47050 54800 5 14 1 1 0 3 1
refdes=U1
T 46850 52900 5 10 1 1 0 0 1
footprint=SOT563-6-most.fp
T 47250 54850 5 10 1 1 0 0 1
device=NTZD3152PT1G
}
N 40800 52100 41750 52100 4
N 41750 52100 41750 52400 4
N 40800 52400 43150 52400 4
{
T 42050 52600 5 11 1 1 180 6 1
netname=20V_IN
}
N 41300 51800 40800 51800 4
N 40800 51500 42300 51500 4
{
T 41800 51555 5 10 1 1 0 3 1
netname=com
}
N 41300 51500 41300 51800 4
N 40800 51200 43150 51200 4
N 40800 50900 43800 50900 4
{
T 40900 51050 5 10 1 1 180 6 1
netname=MCU_PA4_HV_sense
}
N 40800 50600 43150 50600 4
N 40800 50300 43150 50300 4
N 40800 48800 42300 48800 4
{
T 41800 48855 5 10 1 1 0 3 1
netname=com
}
N 41300 48800 41300 49100 4
N 40800 47600 43000 47600 4
{
T 41100 47750 5 10 1 1 180 6 1
netname=MCU_PC0_ADC10_IN
}
N 40800 47900 43000 47900 4
{
T 41100 48050 5 10 1 1 180 6 1
netname=MCU_PC1_ADC11_IN
}
N 40800 48200 42300 48200 4
{
T 41800 48255 5 10 1 1 0 3 1
netname=com
}
N 40800 49100 41300 49100 4
N 45900 49400 45900 54550 4
N 41300 49700 41300 50000 4
C 43550 53700 1 270 0 capacitor-1.sym
{
T 44250 53500 5 10 0 0 270 0 1
device=CL31A106MBHNNNE
T 44450 53500 5 10 0 0 270 0 1
symversion=0.1
T 43550 53700 5 10 0 0 0 0 1
description=CAP CER 10UF 50V X5R 1206 
T 43550 53700 5 10 0 0 0 0 1
footprint=chip_3216_1206_N.fp
T 43650 53100 5 10 1 1 180 0 1
refdes=C6
T 43950 53400 5 10 1 1 90 0 1
value=10 uF
T 43350 53600 5 10 1 1 0 0 1
comment=X5R
}
C 41450 56300 1 0 0 Vdd.sym
{
T 41350 56600 5 10 1 1 0 0 1
net=20V_IN:1
}
C 43650 51650 1 0 0 com.sym
N 43750 52800 43750 51950 4
N 41650 56300 41650 53950 4
N 41650 53950 43750 53950 4
N 43150 53950 43150 52400 4
N 53450 52100 54500 52100 4
{
T 53550 52250 5 11 1 1 180 6 1
netname=20V_IN
}
N 54450 50900 53500 50900 4
N 53000 50300 51850 50300 4
N 53500 50100 53500 48100 4
N 48100 50300 48100 50000 4
N 48850 50100 48850 48100 4
N 40800 48500 46800 48500 4
{
T 41100 48650 5 10 1 1 180 6 1
netname=PA0_TIM_pulser
}
N 40800 49400 45900 49400 4
{
T 41100 49550 5 10 1 1 180 6 1
netname=PA1_TIM_pulser
}
C 53250 55600 1 270 0 capacitor-2.sym
{
T 53950 55400 5 10 0 0 270 0 1
device=UUX1E221MNL1GS
T 54150 55400 5 10 0 0 270 0 1
symversion=0.1
T 53250 55600 5 10 0 0 0 0 1
description=CAP ALUM 220UF 20% 25V SMD
T 53250 55600 5 10 0 0 0 0 1
footprint=cap_10mm_alum_smt.fp
T 53150 54800 5 10 1 1 0 0 1
refdes=C7
T 53350 55300 5 10 1 1 90 0 1
value=220 uF
}
N 53450 55600 53450 56450 4
N 53450 54700 53450 54000 4
C 54050 55500 1 270 0 capacitor-2.sym
{
T 54750 55300 5 10 0 0 270 0 1
device=UUX1E221MNL1GS
T 54950 55300 5 10 0 0 270 0 1
symversion=0.1
T 54050 55500 5 10 0 0 0 0 1
description=CAP ALUM 220UF 20% 25V SMD
T 54050 55500 5 10 0 0 0 0 1
footprint=cap_10mm_alum_smt.fp
T 53950 54700 5 10 1 1 0 0 1
refdes=C8
T 54150 55200 5 10 1 1 90 0 1
value=220 uF
}
N 54250 54600 54250 54200 4
N 53450 54200 54250 54200 4
N 54250 55500 54250 56100 4
N 53450 56100 54250 56100 4
C 53350 53700 1 0 0 com.sym
C 53250 56450 1 0 0 Vdd.sym
{
T 53150 56750 5 10 1 1 0 0 1
net=20V_IN:1
}
N 51800 55600 51800 56100 4
N 51800 54700 51800 54200 4
N 52600 54600 52600 54200 4
N 51800 54200 53450 54200 4
N 52600 55500 52600 56100 4
N 51800 56100 53450 56100 4
C 51600 55600 1 270 0 capacitor-1.sym
{
T 52300 55400 5 10 0 0 270 0 1
device=CL21B105KBFNFNE
T 52500 55400 5 10 0 0 270 0 1
symversion=0.1
T 51600 55600 5 10 0 0 0 0 1
description=CAP CER 1UF 50V X7R
T 51600 55600 5 10 0 0 0 0 1
footprint=chip_2012_0805_N.fp
T 51700 55000 5 10 1 1 180 0 1
refdes=C10
T 52000 55300 5 10 1 1 90 0 1
value=1 uF
T 51400 55500 5 10 1 1 0 0 1
comment=X5R
}
C 52400 55500 1 270 0 capacitor-1.sym
{
T 53100 55300 5 10 0 0 270 0 1
device=CL31A106MBHNNNE
T 53300 55300 5 10 0 0 270 0 1
symversion=0.1
T 52400 55500 5 10 0 0 0 0 1
description=CAP CER 10UF 50V X5R 1206 
T 52400 55500 5 10 0 0 0 0 1
footprint=chip_3216_1206_N.fp
T 52500 54900 5 10 1 1 180 0 1
refdes=C11
T 52800 55200 5 10 1 1 90 0 1
value=10 uF
T 52200 55400 5 10 1 1 0 0 1
comment=X5R
}
T 54350 55650 9 12 1 0 0 0 3
These caps 
go near 
C6, T1-7, T1-8.
C 53000 50100 1 0 0 NFET-gsd.sym
{
T 52350 51150 5 10 1 1 0 0 1
device=NTR5198NL
T 53000 50900 5 10 1 1 0 0 1
refdes=Q2
T 51750 50500 5 10 0 1 0 0 1
footprint=SOT23-123.fp
}
N 42550 55600 42750 55600 4
N 43650 55600 49500 55600 4
N 45900 55450 45900 55600 4
N 46450 54200 46450 55600 4
N 46450 53900 45900 53900 4
N 48750 53600 49050 53600 4
N 49050 53600 49050 55600 4
N 48750 53900 49500 53900 4
N 49500 55450 49500 55600 4
C 47350 48750 1 90 0 resistor-1.sym
{
T 46950 49050 5 10 0 0 90 0 1
device=RC0805FR-074K75L
T 47050 48950 5 10 1 1 90 0 1
refdes=R11
T 47550 49150 5 10 1 1 90 0 1
value=4.75K
T 47350 48750 5 10 0 0 0 0 1
description=4.75k Ohm ±1% 0.125W, 1/8W Chip Resistor 0805 (2012 Metric) 
T 47350 48750 5 10 0 0 0 0 1
footprint=chip_2012_0805_N.fp
}
C 51950 48750 1 90 0 resistor-1.sym
{
T 51550 49050 5 10 0 0 90 0 1
device=RC0805FR-074K75L
T 51650 48950 5 10 1 1 90 0 1
refdes=R10
T 52150 49150 5 10 1 1 90 0 1
value=4.75K
T 51950 48750 5 10 0 0 0 0 1
description=4.75k Ohm ±1% 0.125W, 1/8W Chip Resistor 0805 (2012 Metric) 
T 51950 48750 5 10 0 0 0 0 1
footprint=chip_2012_0805_N.fp
}
C 47150 51250 1 270 0 resistor-1.sym
{
T 47550 50950 5 10 0 0 270 0 1
device=MF-RES-0805-220
T 47050 50250 5 10 1 1 90 0 1
refdes=R13
T 47150 51250 5 10 0 1 90 0 1
footprint=chip_2012_0805_N.fp
T 47050 50850 5 10 1 1 90 0 1
value=2.4K
T 47150 51250 5 10 0 0 90 0 1
description=220 Ohm 1/8 Watt 0805
}
N 46300 51550 46300 53600 4
C 46000 54550 1 90 0 resistor-1.sym
{
T 45600 54850 5 10 0 0 90 0 1
device=RC0805FR-074K75L
T 45700 54750 5 10 1 1 90 0 1
refdes=R15
T 46200 54950 5 10 1 1 90 0 1
value=4.75K
T 46000 54550 5 10 0 0 0 0 1
description=4.75k Ohm ±1% 0.125W, 1/8W Chip Resistor 0805 (2012 Metric) 
T 46000 54550 5 10 0 0 0 0 1
footprint=chip_2012_0805_N.fp
}
C 49600 54550 1 90 0 resistor-1.sym
{
T 49200 54850 5 10 0 0 90 0 1
device=RC0805FR-074K75L
T 49300 54750 5 10 1 1 90 0 1
refdes=R16
T 49800 54950 5 10 1 1 90 0 1
value=4.75K
T 49600 54550 5 10 0 0 0 0 1
description=4.75k Ohm ±1% 0.125W, 1/8W Chip Resistor 0805 (2012 Metric) 
T 49600 54550 5 10 0 0 0 0 1
footprint=chip_2012_0805_N.fp
}
N 48750 54200 50450 54200 4
N 49500 52750 49500 54550 4
N 49500 52750 46800 52750 4
N 43750 53950 43750 53700 4
C 48350 50100 1 0 0 NFET-gsd.sym
{
T 47800 51100 5 10 1 1 0 0 1
device=NTR5198NL
T 48350 50900 5 10 1 1 0 0 1
refdes=Q1
T 47600 51350 5 10 1 1 0 0 1
footprint=SOT23-123.fp
}
T 53400 51000 9 12 1 0 0 0 2
Use either
transistor.
C 54050 48600 1 90 0 diode-1.sym
{
T 53450 49000 5 10 0 0 90 0 1
device=STPS2L25U
T 53500 49300 5 10 1 1 0 0 1
refdes=D4
T 54050 48750 5 10 1 1 0 0 1
value=.45
T 54050 48600 5 10 0 0 90 0 1
description=DIODE Schottky .45V
T 54050 48600 5 10 0 0 90 0 1
footprint=smb-min.fp
}
N 53850 48100 53850 48600 4
N 53850 49500 53850 50900 4
N 53850 50900 54450 50900 4
C 49450 48600 1 90 0 diode-1.sym
{
T 48850 49000 5 10 0 0 90 0 1
device=STPS2L25U
T 48900 49300 5 10 1 1 0 0 1
refdes=D3
T 49400 48750 5 10 1 1 0 0 1
value=.45
T 49450 48600 5 10 0 0 90 0 1
description=DIODE Schottky .43V
T 49450 48600 5 10 0 0 90 0 1
footprint=smb-min.fp
}
T 48950 51300 9 12 1 0 0 0 2
Use either
transistor
N 48850 51150 48850 50900 4
N 49250 48600 49250 48100 4
N 49250 49500 49250 51150 4
C 41650 55400 1 0 0 diode-1.sym
{
T 42050 56000 5 10 0 0 0 0 1
device=R3000-TP
T 42250 56000 5 10 1 1 180 0 1
refdes=D5
T 42550 55300 5 10 1 1 180 0 1
value=3KV
T 41650 55400 5 10 0 0 0 0 1
description=DIODE GEN PURP 3KV 200MA DO15 
T 41650 55400 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
C 42750 55400 1 0 0 diode-1.sym
{
T 43150 56000 5 10 0 0 0 0 1
device=R3000-TP
T 43350 56000 5 10 1 1 180 0 1
refdes=D6
T 43650 55300 5 10 1 1 180 0 1
value=3KV
T 42750 55400 5 10 0 0 0 0 1
description=DIODE GEN PURP 3KV 200MA DO15 
T 42750 55400 5 10 0 0 0 0 1
footprint=diode_10mm.fp
}
C 51750 51300 1 270 0 resistor-1.sym
{
T 52150 51000 5 10 0 0 270 0 1
device=MF-RES-0805-220
T 51650 50300 5 10 1 1 90 0 1
refdes=R12
T 51750 51300 5 10 0 1 90 0 1
footprint=chip_2012_0805_N.fp
T 51650 50900 5 10 1 1 90 0 1
value=2.4K
T 51750 51300 5 10 0 0 90 0 1
description=220 Ohm 1/8 Watt 0805
}
N 50450 54200 50450 53800 4
N 50450 53800 51850 53800 4
N 51850 53800 51850 51300 4
N 48350 50300 48100 50300 4
N 50650 52800 50650 51150 4
N 50650 51150 48850 51150 4
N 46300 51550 47250 51550 4
T 42300 56200 9 12 1 0 0 0 2
Volt dropping 
diodes
N 47250 51250 47250 51550 4
N 46450 53600 46300 53600 4
T 40900 50350 9 10 1 0 0 0 1
MCU_PA2_PWM5_OUT
T 40900 50650 9 10 1 0 0 0 1
MCU_PA3_PWM6_OUT
T 40900 51200 9 10 1 0 0 0 1
MCU_PA5_ADC5_IN
C 43150 50200 1 0 0 nc-right-1.sym
{
T 43250 50700 5 10 0 0 0 0 1
value=NoConnection
T 43250 50900 5 10 0 0 0 0 1
device=DRC_Directive
}
C 43150 50500 1 0 0 nc-right-1.sym
{
T 43250 51000 5 10 0 0 0 0 1
value=NoConnection
T 43250 51200 5 10 0 0 0 0 1
device=DRC_Directive
}
C 43150 51100 1 0 0 nc-right-1.sym
{
T 43250 51600 5 10 0 0 0 0 1
value=NoConnection
T 43250 51800 5 10 0 0 0 0 1
device=DRC_Directive
}
C 43000 47500 1 0 0 nc-right-1.sym
{
T 43100 48000 5 10 0 0 0 0 1
value=NoConnection
T 43100 48200 5 10 0 0 0 0 1
device=DRC_Directive
}
C 43000 47800 1 0 0 nc-right-1.sym
{
T 43100 48300 5 10 0 0 0 0 1
value=NoConnection
T 43100 48500 5 10 0 0 0 0 1
device=DRC_Directive
}
