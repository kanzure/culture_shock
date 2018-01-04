v 20150930 2
C 37600 38200 0 0 0 title-A-cibolo.sym
{
T 58500 38200 5 10 1 1 0 0 1
file=pyflex_f401.sch
T 62600 37900 5 10 1 1 0 0 1
drawn-by=John Griessen
T 50800 38000 5 18 1 1 0 0 1
title=Culture Shock PYFLEX_F401
T 58700 37900 5 10 1 1 0 0 1
first-pagenum=1
T 59400 37900 5 10 1 1 0 0 1
last-pagenum=2
T 62600 38200 5 10 1 1 0 0 1
rev=2017-12-28 v0.4
T 64400 43400 5 18 1 1 270 0 1
title2=Culture Shock PYFLEX_F401
}
N 44200 51400 44200 54600 4
N 45100 51400 45100 53000 4
N 44200 54300 44500 54300 4
N 50600 49000 50600 49800 4
N 50600 49300 49300 49300 4
C 49700 48800 1 0 0 capacitor-1.sym
{
T 49900 49500 5 10 0 0 0 0 1
device=CAPACITOR
T 49900 49700 5 10 0 0 0 0 1
symversion=0.1
T 50200 48700 5 10 1 1 180 0 1
refdes=C20
T 49700 48800 5 10 0 0 0 0 1
footprint=1206.fp
}
N 49700 49000 49300 49000 4
N 40300 51400 44800 51400 4
N 44500 53000 46400 53000 4
C 47500 43500 1 90 0 capacitor-1.sym
{
T 46800 43700 5 10 0 0 90 0 1
device=CAPACITOR
T 46600 43700 5 10 0 0 90 0 1
symversion=0.1
T 47200 43800 5 10 1 1 180 0 1
refdes=C29
T 47400 43700 5 10 1 1 0 0 1
value=4.7 uF
T 47100 43900 5 10 0 1 270 0 1
footprint=CAPC1608N.lht
}
N 47300 44700 47300 44400 4
N 47900 44500 48300 44500 4
N 46000 51400 46000 54100 4
T 45200 54600 9 12 1 0 0 0 1
BOOT0
N 45600 54100 46000 54100 4
C 45700 53200 1 90 0 resistor-1.sym
{
T 45300 53500 5 10 0 0 90 0 1
device=R_100k_5%_1608
T 45500 54000 5 10 1 1 180 0 1
refdes=R24
T 45900 53400 5 10 1 1 90 0 1
value=100K
T 45700 53200 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 45700 53200 5 10 0 0 0 0 1
description=Res thick 100k 1% 1608
}
N 45600 53000 45600 53200 4
C 64500 48600 1 0 1 ffc-zif-20.sym
{
T 64400 55200 5 10 1 1 0 6 1
refdes=J1
T 64500 48600 5 10 0 0 0 0 1
value=conn
T 64500 48600 5 10 0 0 0 0 1
footprint=ffc_zif_20_1.25.lht
}
N 44600 44300 42800 44300 4
{
T 43750 44350 5 10 1 1 0 6 1
netname=PA3_TIM5.4
}
N 44900 44000 42800 44000 4
{
T 44750 44050 5 10 1 1 0 6 1
netname=PA4_ADC1.4_HV_sense
}
N 49300 47800 51500 47800 4
{
T 49400 47850 5 10 1 1 0 0 1
netname=PA11_OTG_FS_DM
}
N 49300 47500 51500 47500 4
{
T 49400 47550 5 10 1 1 0 0 1
netname=PA10_OTG_FS_ID
}
N 63200 49900 62500 49900 4
N 63200 49000 62500 49000 4
N 62500 49900 62500 49000 4
N 52100 57300 52100 56700 4
C 50900 55700 1 0 0 USB_SMT_5p.sym
{
T 50900 56950 5 10 1 1 0 0 1
refdes=J4
T 51190 56010 5 16 0 1 90 0 1
device=microUSB_B_2leg
T 51200 68150 5 10 0 0 0 0 1
footprint=microUSB_AB_2.lht
T 50900 55700 5 10 0 0 0 0 1
value=conn
}
N 53200 56500 55500 56500 4
{
T 53800 56550 5 10 1 1 0 0 1
netname=PA11_OTG_FS_DM
}
N 52100 56300 52500 56300 4
C 44000 54600 1 0 0 Vdd.sym
{
T 44050 54850 5 10 1 1 0 0 1
net=3V1:1
}
N 44500 56400 44500 57000 4
N 43500 57000 45400 57000 4
C 44700 55500 1 90 0 capacitor-1.sym
{
T 44000 55700 5 10 0 0 90 0 1
device=MF-CAP-0603-1uF
T 43800 55700 5 10 0 0 90 0 1
symversion=0.1
T 44700 55500 5 10 0 0 0 0 1
footprint=chip_1608_0603_N.fp
T 44700 55500 5 10 0 0 0 0 1
description=1 uF X7R 25V
T 44100 56100 5 10 1 1 0 0 1
refdes=C11
T 44600 55700 5 10 1 1 0 0 1
value=1 uF
}
C 45600 55500 1 90 0 capacitor-1.sym
{
T 44900 55700 5 10 0 0 90 0 1
device=MF-CAP-0603-0.1uF
T 44700 55700 5 10 0 0 90 0 1
symversion=0.1
T 45600 55500 5 10 0 0 0 0 1
footprint=chip_1608_0603_N.fp
T 45600 55500 5 10 0 0 0 0 1
description=Capacitor MLCC 0603 0.1uF 10% 25V
T 45000 56100 5 10 1 1 0 0 1
refdes=C10
T 45500 55700 5 10 1 1 0 0 1
value=0.1 uF
}
N 45400 56400 45400 57000 4
C 44100 55500 1 90 0 capacitor-1.sym
{
T 43400 55700 5 10 0 0 90 0 1
device=MF-CAP-0603-1uF
T 43200 55700 5 10 0 0 90 0 1
symversion=0.1
T 44100 55500 5 10 0 0 0 0 1
footprint=chip_1608_0603_N.fp
T 44100 55500 5 10 0 0 0 0 1
description=1 uF X7R 25V
T 43500 56100 5 10 1 1 0 0 1
refdes=C12
T 44000 55700 5 10 1 1 0 0 1
value=1 uF
}
N 43000 55500 45400 55500 4
C 44800 57000 1 0 0 Vdd.sym
{
T 44800 57200 5 10 1 1 0 0 1
net=3V1:1
}
N 43900 56400 44500 56400 4
N 43000 55500 43000 56600 4
N 42500 57000 41900 57000 4
N 41900 57000 41900 57400 4
C 42500 56600 1 0 0 regulator_sot23.sym
{
T 42500 58700 5 8 0 0 0 0 1
symversion=3.0
T 43500 57200 5 10 1 1 0 0 1
value=3.3
T 42600 57700 5 10 1 1 0 0 1
refdes=U1
T 43000 56500 5 8 1 1 0 0 1
footprint=SOT23-123.fp
T 42580 57449 5 10 1 1 0 0 1
device=AP2120N-3.3TRG1
}
N 52100 55500 52100 55900 4
N 62500 51700 63200 51700 4
N 63200 51400 62900 51400 4
N 62900 51400 62900 51700 4
N 63200 50800 62500 50800 4
N 63200 50500 62900 50500 4
N 62900 50500 62900 50800 4
N 63200 51100 60300 51100 4
{
T 62800 51150 5 10 1 1 0 6 1
netname=PA1_TIM5_CH2
}
N 63200 50200 60300 50200 4
{
T 62800 50250 5 10 1 1 0 6 1
netname=PA0_TIM2_CH1/TIM2_ETR
}
N 63200 52600 60300 52600 4
{
T 62700 52650 5 10 1 1 0 6 1
netname=PA4_ADC1.4_HV_sense
}
N 63200 52900 60300 52900 4
{
T 63000 52950 5 10 1 1 0 6 1
netname=PA5_ADC1.5_current_sense
}
N 62500 54700 63200 54700 4
N 63200 54400 62900 54400 4
N 62900 54400 62900 54700 4
N 63200 54100 61300 54100 4
N 63200 53800 62900 53800 4
N 62900 53800 62900 54100 4
N 63200 53500 62500 53500 4
N 63200 53200 62900 53200 4
N 62900 53200 62900 53500 4
N 51300 47200 54200 47200 4
{
T 52100 47250 5 10 1 1 0 0 1
netname=PA9_OTG_FS_VBUS
}
N 49300 46900 50500 46900 4
{
T 49700 46950 5 10 1 1 0 0 1
netname=PA8
}
C 57800 41300 1 0 0 tp5000_charger.sym
{
T 62600 43300 5 10 0 0 0 0 1
footprint=QFN16-min
T 62600 43700 5 10 0 0 0 0 1
device=TP5000
T 60100 44600 5 14 1 1 0 3 1
refdes=U6
T 57800 41300 5 10 0 0 0 0 1
value=IC
}
N 60700 43200 60900 43200 4
N 59300 41300 59300 41000 4
N 57500 41000 62900 41000 4
N 59000 41300 59000 41000 4
C 61500 42100 1 270 0 capacitor-1.sym
{
T 62200 41900 5 10 0 0 270 0 1
device=CL10B104JO8NNNC
T 62400 41900 5 10 0 0 270 0 1
symversion=0.1
T 61200 41700 5 10 1 1 0 0 1
refdes=C61
T 61100 41400 5 10 1 1 0 0 1
value=0.1 uF
T 61500 42100 5 10 0 0 0 0 1
footprint=CAPC1608N.lht
}
N 61700 41200 61700 41000 4
N 60700 42600 61700 42600 4
N 61700 42600 61700 42100 4
C 44700 51900 1 90 0 capacitor-1.sym
{
T 44000 52100 5 10 0 0 90 0 1
device=CAPACITOR
T 43800 52100 5 10 0 0 90 0 1
symversion=0.1
T 44900 52200 5 10 1 1 180 0 1
refdes=C28
T 44400 52100 5 10 0 1 90 0 1
footprint=CAPC1608N.lht
}
N 44500 52800 44500 53300 4
N 47600 43500 47600 44700 4
N 48200 42800 48200 43500 4
N 44900 44000 44900 44700 4
N 45200 44700 45200 43700 4
N 44600 44700 44600 44300 4
C 39200 45600 1 180 1 ffc-zif-20.sym
{
T 40742 40708 5 10 0 0 180 6 1
device=zif_connector
T 39600 45800 5 10 1 1 180 6 1
refdes=J2
T 39200 45600 5 10 0 0 0 0 1
value=conn
T 39200 45600 5 10 0 0 0 0 1
footprint=ffc_zif_20_1.25.lht
}
C 50400 49800 1 0 0 Vdd.sym
{
T 50400 50000 5 10 1 1 0 0 1
net=3V1:1
}
C 45500 54300 1 0 1 switch-pushbutton-no-1.sym
{
T 45100 54900 5 10 0 0 180 2 1
device=SWITCH_PUSHBUTTON_NO_4mm
T 45100 54600 5 10 1 1 180 2 1
refdes=SW23
}
N 45500 54300 45600 54300 4
N 45600 54300 45600 54100 4
C 47000 52900 1 0 0 JTAG_5x2.sym
{
T 46800 54400 5 10 0 1 0 0 1
device=HEADER10
T 48050 54550 5 10 1 1 180 0 1
refdes=J3
T 47000 52900 5 10 0 0 0 0 1
footprint=2x5hdr_1.27.fp
T 47000 52900 5 10 0 0 0 0 1
value=conn
}
N 47500 51400 47500 52500 4
N 47500 52500 48700 52500 4
N 48700 52500 48700 53600 4
N 48300 53600 48700 53600 4
N 47200 51400 47200 52700 4
N 47200 52700 48300 52700 4
N 48300 52700 48300 53000 4
N 48100 51400 48100 52100 4
N 48100 52100 48900 52100 4
N 48900 52100 48900 53900 4
N 48900 53900 48300 53900 4
N 49300 48400 49600 48400 4
N 49600 48400 49600 52300 4
N 49100 54200 48300 54200 4
C 47000 53400 1 180 0 nc-right-1.sym
{
T 46900 52900 5 10 0 0 180 0 1
value=NoConnection
T 46900 52700 5 10 0 0 180 0 1
device=DRC_Directive
}
N 47000 53900 47000 53600 4
N 46400 53600 47000 53600 4
N 46400 53600 46400 53000 4
C 46800 54600 1 0 0 Vdd.sym
{
T 46800 54800 5 10 1 1 0 0 1
net=3V1:1
}
N 47000 54600 47000 54200 4
N 46900 51400 46900 53000 4
N 53400 55600 55400 55600 4
{
T 53700 55650 5 10 1 1 0 0 1
netname=PA10_OTG_FS_ID
}
N 49100 52300 49600 52300 4
N 49100 52300 49100 54200 4
C 44700 53300 1 90 0 capacitor-1.sym
{
T 44000 53500 5 10 0 0 90 0 1
device=CAPACITOR
T 43800 53500 5 10 0 0 90 0 1
symversion=0.1
T 44900 53600 5 10 1 1 180 0 1
refdes=C22
T 44400 53800 5 10 0 1 90 0 1
footprint=CAPC1608N.lht
}
N 44500 54200 44500 54300 4
N 44500 51900 44500 51400 4
N 40500 44600 43700 44600 4
{
T 40850 44650 5 10 1 1 0 0 1
netname=PC13
}
N 47300 43500 48200 43500 4
C 47900 44400 1 270 0 capacitor-1.sym
{
T 48600 44200 5 10 0 0 270 0 1
device=CAPACITOR
T 48800 44200 5 10 0 0 270 0 1
symversion=0.1
T 48000 44200 5 10 1 1 180 0 1
refdes=C21
T 47900 44400 5 10 0 0 180 0 1
footprint=CAPC1608N.lht
T 48700 44200 5 10 1 1 180 0 1
value=4.7uF
}
N 48100 44400 48100 44500 4
N 47900 44500 47900 44700 4
N 45500 44700 45500 43400 4
N 45500 43400 40500 43400 4
{
T 41900 43450 5 10 1 1 0 6 1
netname=PA6_ADC1.6
}
N 45800 44700 45800 43100 4
N 45800 43100 40500 43100 4
{
T 41900 43150 5 10 1 1 0 6 1
netname=PA7_ADC1.7
}
N 46100 44700 46100 42500 4
N 46100 42500 40500 42500 4
{
T 41200 42550 5 10 1 1 0 6 1
netname=PB0
}
N 46400 44700 46400 42200 4
N 46400 42200 40500 42200 4
{
T 41200 42250 5 10 1 1 0 6 1
netname=PB1
}
N 40500 41900 46700 41900 4
{
T 40850 41950 5 10 1 1 0 0 1
netname=PB2
}
N 46700 41900 46700 44700 4
N 47000 44700 47000 42900 4
C 43400 44700 1 0 0 stm32f401ce.sym
{
T 49300 52200 5 10 0 0 0 0 1
device=STM32F401CE
T 48500 51200 5 20 1 1 0 3 1
refdes=U2
T 43400 44700 5 10 0 0 0 0 1
value=IC
}
C 42200 47300 1 0 0 capacitor-1.sym
{
T 42400 48000 5 10 0 0 0 0 1
device=CAPACITOR
T 42400 48200 5 10 0 0 0 0 1
symversion=0.1
T 42500 47700 5 10 1 1 180 0 1
refdes=C27
T 42200 47300 5 10 0 0 0 0 1
footprint=CAPC1608N.lht
}
N 43400 47500 43100 47500 4
N 40300 47200 43400 47200 4
N 42900 49600 43400 49600 4
N 42200 49300 43400 49300 4
N 42200 47200 42200 47500 4
C 41200 48900 1 0 0 capacitor-1.sym
{
T 41400 49600 5 10 0 0 0 0 1
device=CAPACITOR
T 41400 49800 5 10 0 0 0 0 1
symversion=0.1
T 41200 48900 5 10 0 0 0 0 1
footprint=0805.fp
T 41500 49000 5 10 1 1 180 0 1
refdes=C25
T 41800 49200 5 10 1 1 0 0 1
value=7 pF
}
N 43000 48400 43400 48400 4
N 43400 48700 43400 49000 4
N 43400 49000 43000 49000 4
C 41200 48300 1 0 0 capacitor-1.sym
{
T 41400 49000 5 10 0 0 0 0 1
device=CAPACITOR
T 41400 49200 5 10 0 0 0 0 1
symversion=0.1
T 41200 48300 5 10 0 0 0 0 1
footprint=0805.fp
T 41500 48400 5 10 1 1 180 0 1
refdes=C26
T 41800 48600 5 10 1 1 0 0 1
value=7 pF
}
N 43400 48100 41600 48100 4
{
T 42900 47950 5 10 1 1 0 6 1
netname=NRST
}
N 42100 48200 42100 48500 4
N 41200 48500 40900 48500 4
N 40900 48500 40900 50100 4
N 40900 49100 41200 49100 4
N 42000 50100 42600 50100 4
C 41100 49400 1 0 0 capacitor-1.sym
{
T 41300 50100 5 10 0 0 0 0 1
device=CAPACITOR
T 41300 50300 5 10 0 0 0 0 1
symversion=0.1
T 41100 49400 5 10 0 0 0 0 1
footprint=0805.fp
T 41400 49500 5 10 1 1 180 0 1
refdes=C24
T 41000 49700 5 10 1 1 0 0 1
value=9 pF
}
C 41100 49900 1 0 0 capacitor-1.sym
{
T 41300 50600 5 10 0 0 0 0 1
device=CAPACITOR
T 41300 50800 5 10 0 0 0 0 1
symversion=0.1
T 41100 49900 5 10 0 0 0 0 1
footprint=0805.fp
T 41400 50000 5 10 1 1 180 0 1
refdes=C23
T 41000 50200 5 10 1 1 0 0 1
value=9 pF
}
N 40900 49600 41100 49600 4
N 43400 46600 40000 46600 4
{
T 43000 46650 5 10 1 1 0 6 1
netname=PA1_TIM5_CH2
}
N 43400 46900 40000 46900 4
{
T 43000 46950 5 10 1 1 0 6 1
netname=PA0_TIM2_CH1/TIM2_ETR
}
N 43400 46300 40000 46300 4
{
T 43200 46350 5 10 1 1 0 6 1
netname=PA2_USART2_TX_TIM5.3
}
N 41900 47800 43100 47800 4
N 43100 47800 43100 47500 4
N 41900 47700 41900 47800 4
N 40600 47700 41900 47700 4
C 41600 47900 1 0 1 switch-pushbutton-no-1.sym
{
T 41200 48500 5 10 0 0 180 2 1
device=SWITCH_PUSHBUTTON_NO
T 40800 48300 5 10 1 1 0 2 1
refdes=SW22
}
N 41600 48100 41600 47900 4
N 40600 47700 40600 47900 4
C 40300 49000 1 270 0 coil-1.sym
{
T 40700 48800 5 10 0 0 270 0 1
device=MLZ2012N100LT000
T 40900 48800 5 10 0 0 270 0 1
symversion=0.1
T 40000 48500 5 10 1 1 0 0 1
refdes=L20
T 39800 48300 5 10 1 1 0 0 1
value=10uH
T 40300 49000 5 10 0 0 0 0 1
footprint=INDC2013N.lht
}
N 40300 47200 40300 48000 4
C 42400 49900 1 270 0 crystal-2.sym
{
T 43100 49800 5 10 0 0 270 0 1
device=CRYSTAL
T 42400 49900 5 10 0 0 270 0 1
footprint=1812.fp
T 42426 49544 5 10 1 1 180 0 1
refdes=X2
T 42600 49900 5 10 1 1 180 0 1
value=32.78kHz
}
N 42600 49900 42600 50100 4
C 43300 48400 1 90 0 crystal-gnd-4.sym
{
T 42500 48500 5 10 0 0 90 0 1
device=FA-20H
T 43300 48400 5 10 0 1 0 0 1
footprint=XTALCC2520.lht
T 42626 48744 5 10 1 1 180 0 1
refdes=X1
}
N 40700 48900 40900 48900 4
N 43000 48400 43000 48200 4
N 42100 48200 43000 48200 4
N 42100 49100 43000 49100 4
N 43000 49100 43000 49000 4
N 42900 49900 42900 49600 4
N 42900 49900 42600 49900 4
N 42700 49000 42200 49000 4
N 42200 49000 42200 48800 4
N 40900 48800 42300 48800 4
N 42700 48400 42300 48400 4
N 42300 48400 42300 48800 4
N 40900 50100 41100 50100 4
N 42200 49300 42200 49600 4
N 42200 49600 42000 49600 4
N 42300 50500 43100 50500 4
{
T 42400 50550 5 10 1 1 0 0 1
netname=PC13
}
N 43100 49900 43400 49900 4
N 43100 49900 43100 50500 4
N 43400 50200 43400 50800 4
N 40300 49000 40300 51400 4
N 52100 56500 52300 56500 4
N 52100 56100 52300 56100 4
N 52300 56100 52300 55600 4
N 49300 48100 51500 48100 4
{
T 49400 48150 5 10 1 1 0 0 1
netname=PA12_OTG_FS_DP
}
N 52500 56000 52500 56300 4
N 53200 57300 53400 57300 4
N 52300 55600 52500 55600 4
N 54300 56000 55900 56000 4
{
T 54300 56050 5 10 1 1 0 0 1
netname=PA12_OTG_FS_DP
}
N 53400 56000 52500 56000 4
N 50500 46300 49300 46300 4
{
T 50200 46350 5 10 1 1 0 6 1
netname=PB14
}
N 47800 51400 47800 52300 4
N 48300 53300 48500 53300 4
N 48500 52300 48500 53300 4
N 48500 52300 47800 52300 4
T 46200 57300 9 18 1 0 0 0 1
Cortex Debug Connector J3
L 47750 57000 47750 56600 3 10 1 0 -1 -1
L 48350 57000 48350 55600 3 10 1 0 -1 -1
V 47900 56900 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 47900 56600 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 48200 56900 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 48200 56600 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 48200 56300 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 47900 56300 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 48200 56000 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 47900 56000 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 48200 55700 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
V 47900 55700 50 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
L 47750 56000 47750 55600 3 10 1 0 -1 -1
N 47000 54600 46600 54600 4
N 46600 53700 46600 53000 4
N 46600 53000 47000 53000 4
T 46400 56300 9 15 1 0 0 1 5
      VCC
      GND
      GND
      KEY
GNDDet
L 47750 57000 47600 57000 3 10 1 0 -1 -1
L 47600 57000 47600 56600 3 10 1 0 -1 -1
L 47750 56600 47600 56600 3 10 1 0 -1 -1
L 47750 56000 47600 56000 3 10 1 0 -1 -1
L 47600 56000 47600 55600 3 10 1 0 -1 -1
L 47600 55600 47750 55600 3 10 1 0 -1 -1
L 48350 55600 48500 55600 3 10 1 0 -1 -1
L 48500 55600 48500 57000 3 10 1 0 -1 -1
L 48500 57000 48350 57000 3 10 1 0 -1 -1
T 48700 56300 9 15 1 0 0 1 5
SWDIO/TMS
SWDCLK/TCK
SWO/TDO
NC/TDI
nRESET
N 45200 43700 42800 43700 4
{
T 45100 43750 5 10 1 1 0 6 1
netname=PA5_ADC1.5_current_sense
}
C 48100 44500 1 0 0 Vdd.sym
{
T 48100 44700 5 10 1 1 0 0 1
net=3V1:1
}
C 61500 54100 1 0 1 power_+.sym
{
T 62000 54300 5 10 1 1 0 6 1
net=18V_ONBOARD:1
}
N 61700 49300 63200 49300 4
{
T 62200 49350 5 10 1 1 0 6 1
netname=PB9
}
N 45400 51400 45400 52000 4
{
T 45350 51900 5 10 1 1 90 6 1
netname=PB9
}
N 45700 51400 45700 52000 4
{
T 45650 51900 5 10 1 1 90 6 1
netname=LED
}
N 61700 49600 63200 49600 4
N 40500 41300 42300 41300 4
{
T 42200 41350 5 10 1 1 0 6 1
netname=I2C1_SDA_PB7
}
N 40500 41000 42300 41000 4
{
T 42200 41050 5 10 1 1 0 6 1
netname=I2C1_SCL_PB6
}
N 40500 45200 42200 45200 4
N 40500 44900 41100 44900 4
N 41100 44900 41100 45200 4
N 40500 40700 42200 40700 4
C 48200 42900 1 0 1 switch-pushbutton-no-1.sym
{
T 47800 43500 5 10 0 0 180 2 1
device=SWITCH_PUSHBUTTON_NO
T 47400 43300 5 10 1 1 0 2 1
refdes=S21
}
N 47000 42900 47200 42900 4
C 43500 54000 1 270 0 resistor-1.sym
{
T 43900 53700 5 10 0 0 270 0 1
device=2013M R 1.5 k 1%
T 43500 54000 5 10 0 0 90 0 1
footprint=RESC2013N.lht
T 43400 53200 5 10 1 1 90 0 1
refdes=R20
T 43900 53400 5 10 1 1 90 0 1
value=1.680R
}
N 43600 54000 44200 54000 4
N 43600 52400 43600 53100 4
{
T 43550 52800 5 10 1 1 90 6 1
netname=LED
}
C 61700 49700 1 180 0 nc-right-1.sym
{
T 61600 49200 5 10 0 0 180 0 1
value=NoConnection
T 61600 49000 5 10 0 0 180 0 1
device=DRC_Directive
}
T 39400 56400 9 12 1 0 0 0 2
other regulator
goes here.
B 39000 55000 2200 2700 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
N 63200 52000 60300 52000 4
{
T 62900 52050 5 10 1 1 0 6 1
netname=PA2_USART2_TX_TIM5.3
}
N 43400 50800 42500 50800 4
{
T 43300 50850 5 10 1 1 0 6 1
netname=VBAT
}
N 63200 52300 60300 52300 4
{
T 61750 52350 5 10 1 1 0 6 1
netname=PA3_TIM5.4
}
N 40500 44300 41700 44300 4
{
T 41300 44350 5 10 1 1 0 6 1
netname=VBAT
}
N 46300 51400 46300 52800 4
{
T 46250 52800 5 10 1 1 90 6 1
netname=I2C1_SDA_PB7
}
N 46600 51400 46600 52900 4
{
T 46550 52800 5 10 1 1 90 6 1
netname=I2C1_SCL_PB6
}
N 40500 41600 41600 41600 4
{
T 40900 41650 5 10 1 1 0 0 1
netname=3V1
}
N 40500 43700 42200 43700 4
N 40500 42800 42200 42800 4
N 40500 39500 41900 39500 4
N 40500 44000 41700 44000 4
{
T 40900 44150 5 10 1 1 180 6 1
netname=NRST
}
N 40500 40400 41900 40400 4
N 40500 40100 41900 40100 4
N 41900 40100 41900 40700 4
N 40500 39800 42200 39800 4
N 61300 56700 60200 56700 4
{
T 61100 56750 5 10 1 1 0 6 1
netname=PB14
}
N 49300 45700 50500 45700 4
{
T 50200 45750 5 10 1 1 0 6 1
netname=PB12
}
N 50500 46000 49300 46000 4
{
T 50200 46050 5 10 1 1 0 6 1
netname=PB13
}
N 60800 57300 60800 57000 4
N 60800 57000 61300 57000 4
N 61300 56400 60200 56400 4
{
T 61100 56450 5 10 1 1 0 6 1
netname=PB13
}
N 61300 55800 61300 56100 4
C 63900 56600 1 0 1 power_+.sym
{
T 64500 56800 5 10 1 1 0 6 1
net=18V_ONBOARD:1
}
N 63700 56600 63700 56400 4
N 63700 56400 63100 56400 4
C 61300 55900 1 0 0 pyflex_f401_boost.sym
{
T 62200 56900 5 10 0 0 0 0 1
device=boost_converter_subcircuit
T 62674 57356 5 10 1 1 0 0 1
refdes=S1
T 61300 55900 5 10 0 0 0 0 1
source=pyflex_f401_boost.sch
T 61300 55900 5 10 0 0 0 0 1
value=module
}
C 55900 52000 1 0 1 Vdd.sym
{
T 55700 52250 5 10 1 1 0 3 1
net=C_VBUS:1
}
C 42100 57400 1 0 1 Vdd.sym
{
T 41900 57650 5 10 1 1 0 3 1
net=VUNREG:1
}
N 50600 52500 50600 57300 4
N 53900 52500 53900 52400 4
N 55700 51900 55700 52000 4
N 53900 51400 53900 50900 4
N 53900 50900 55700 50900 4
{
T 54000 50950 5 10 1 1 0 0 1
netname=VUNREG
}
N 55100 49400 55100 49800 4
{
T 55050 49400 5 10 1 1 90 0 1
netname=PA8
}
N 58200 51800 57500 51800 4
{
T 58100 51850 5 10 1 1 0 6 1
netname=VBAT
}
N 57500 51400 57500 51800 4
N 58000 50400 55700 50400 4
N 55700 50400 55700 50900 4
C 58200 49500 1 90 0 capacitor-1.sym
{
T 57500 49700 5 10 0 0 90 0 1
device=CAPACITOR
T 57300 49700 5 10 0 0 90 0 1
symversion=0.1
T 58300 50000 5 10 1 1 0 0 1
refdes=C90
T 58200 49500 5 10 0 0 90 0 1
footprint=1206.fp
T 58200 49600 5 10 1 1 0 0 1
value=4.7uF
}
B 51300 53400 2700 1600 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 51600 53400 9 12 1 0 0 0 3
Add an ESD protection 
device for D+ D- VBUS

C 56500 55600 1 0 0 USB_SMT_5p.sym
{
T 56500 56850 5 10 1 1 0 0 1
refdes=J5
T 56790 55910 5 16 0 1 90 0 1
device=microUSB_AB_antek
T 56800 68050 5 10 0 0 0 0 1
footprint=microUSB_AB_1.fp
T 56500 55600 5 10 0 0 0 0 1
value=conn
}
C 57900 57400 1 0 1 Vdd.sym
{
T 57700 57650 5 10 1 1 0 3 1
net=C_VBUS:1
}
C 61000 57300 1 0 1 Vdd.sym
{
T 60800 57550 5 10 1 1 0 3 1
net=VUNREG:1
}
N 50500 46600 49300 46600 4
{
T 50200 46650 5 10 1 1 0 6 1
netname=PB15
}
N 56900 49300 56900 48800 4
{
T 56850 49200 5 10 1 1 90 6 1
netname=PB15
}
N 56900 50900 56900 50200 4
N 55100 50700 55100 51400 4
N 53300 49900 53300 50300 4
{
T 53250 49900 5 10 1 1 90 0 1
netname=PB9
}
C 53200 51200 1 270 0 resistor-1.sym
{
T 53600 50900 5 10 0 0 270 0 1
device=R_8.87k_1%_1608
T 53200 51200 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 53100 50300 5 10 1 1 90 0 1
refdes=R4
T 53600 50600 5 10 1 1 90 0 1
value=8.87k
}
N 53300 51900 53300 51200 4
N 59000 44700 59000 45100 4
N 53400 56000 53400 57300 4
C 53200 57400 1 180 0 resistor-1.sym
{
T 52900 57000 5 10 0 0 180 0 1
device=R_1.78k_1%_1608
T 53200 57400 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 52400 57400 5 10 1 1 0 0 1
refdes=R9
T 52900 57100 5 10 1 1 0 0 1
value=1.78k
}
C 54300 56100 1 180 0 resistor-1.sym
{
T 54000 55700 5 10 0 0 180 0 1
device=R_15_1%_1608
T 54300 56100 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 53500 56100 5 10 1 1 0 0 1
refdes=R6
T 54100 55800 5 10 1 1 0 0 1
value=15
}
N 57700 57400 57700 56600 4
N 57700 56200 58100 56200 4
N 57700 55300 57700 55800 4
N 57700 56400 57900 56400 4
N 57700 56000 57900 56000 4
N 57900 56000 57900 55500 4
N 58100 55900 58100 56200 4
N 58800 57200 59000 57200 4
C 58800 56500 1 180 0 resistor-1.sym
{
T 58500 56100 5 10 0 0 180 0 1
device=R_22_1%_1608
T 58800 56500 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 58000 56500 5 10 1 1 0 0 1
refdes=R32
T 58600 56200 5 10 1 1 0 0 1
value=22
}
N 57900 55500 58100 55500 4
N 59000 55900 58100 55900 4
N 59000 55900 59000 57200 4
C 58800 57300 1 180 0 resistor-1.sym
{
T 58500 56900 5 10 0 0 180 0 1
device=R_1.78k_1%_1608
T 58800 57300 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 58000 57300 5 10 1 1 0 0 1
refdes=R33
T 58500 57000 5 10 1 1 0 0 1
value=1.78k
}
C 59000 55600 1 180 0 resistor-1.sym
{
T 58700 55200 5 10 0 0 180 0 1
device=R_22_1%_1608
T 59000 55600 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 58200 55600 5 10 1 1 0 0 1
refdes=R31
T 58800 55300 5 10 1 1 0 0 1
value=22
}
C 59900 56000 1 180 0 resistor-1.sym
{
T 59600 55600 5 10 0 0 180 0 1
device=R_22_1%_1608
T 59900 56000 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 59100 56000 5 10 1 1 0 0 1
refdes=R30
T 59700 55700 5 10 1 1 0 0 1
value=22
}
N 57900 57200 57700 57200 4
N 58600 55500 59200 55500 4
N 59900 55900 60100 55900 4
T 58200 54500 9 12 1 0 0 0 2
check grounding 
of ID pin is correct.
B 58000 54100 2100 1000 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 58400 46600 9 12 1 0 0 0 1
Add LED
C 53300 52400 1 180 1 PFET_enh.sym
{
T 54000 51800 5 10 1 1 180 6 1
refdes=Q1
T 53300 52400 5 10 0 0 180 6 1
footprint=SOT23-3N.lht
T 54000 52000 5 10 1 1 180 6 1
device=TSM650P02CX
T 53300 52400 5 10 0 0 0 0 1
description=MOSFET P-CH -30V -4.1A Vgs+/-12V
}
C 55100 51900 1 180 1 PFET_enh.sym
{
T 55800 51300 5 10 1 1 180 6 1
refdes=Q2
T 55100 51900 5 10 0 0 180 6 1
footprint=SOT23-3N.lht
T 55800 51500 5 10 1 1 180 6 1
device=TSM650P02CX
T 55100 51900 5 10 0 0 0 0 1
description=MOSFET P-CH -30V -4.1A Vgs+/-12V
}
C 56900 51400 1 180 1 PFET_enh.sym
{
T 57600 50800 5 10 1 1 180 6 1
refdes=Q3
T 56900 51400 5 10 0 0 180 6 1
footprint=SOT23-3N.lht
T 57600 51000 5 10 1 1 180 6 1
device=TSM650P02CX
T 56900 51400 5 10 0 0 0 0 1
description=MOSFET P-CH -30V -4.1A Vgs+/-12V
}
C 55000 50700 1 270 0 resistor-1.sym
{
T 55400 50400 5 10 0 0 270 0 1
device=R_8.87k_1%_1608
T 55000 50700 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 54900 49800 5 10 1 1 90 0 1
refdes=R5
T 55400 50100 5 10 1 1 90 0 1
value=8.87k
}
C 56800 50200 1 270 0 resistor-1.sym
{
T 57200 49900 5 10 0 0 270 0 1
device=R_8.87k_1%_1608
T 56800 50200 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 56700 49300 5 10 1 1 90 0 1
refdes=R3
T 57200 49600 5 10 1 1 90 0 1
value=8.87k
}
N 50600 52500 53900 52500 4
{
T 51600 52550 5 10 1 1 0 0 1
netname=PA9_OTG_FS_VBUS
}
N 50600 57300 52300 57300 4
C 57200 42000 1 90 1 coil-1.sym
{
T 56800 41800 5 10 0 0 270 2 1
device=NRS2012T4R7MGJ
T 57200 42000 5 10 0 0 0 6 1
footprint=INDC2020N.lht
T 57000 41300 5 10 1 1 0 6 1
refdes=L61
T 57000 41600 5 10 1 1 0 6 1
value=4.7 uH
}
C 50500 45600 1 0 0 nc-right-1.sym
{
T 50600 46100 5 10 0 0 0 0 1
value=NoConnection
T 50600 46300 5 10 0 0 0 0 1
device=DRC_Directive
}
C 59100 45100 1 90 0 nc-right-1.sym
{
T 58600 45200 5 10 0 0 90 0 1
value=NoConnection
T 58400 45200 5 10 0 0 90 0 1
device=DRC_Directive
}
N 57800 42300 57200 42300 4
N 57200 42000 57200 42600 4
N 59600 41300 59600 40700 4
N 59600 40700 57200 40700 4
N 57200 41000 57200 40700 4
C 59700 45100 1 90 0 nc-right-1.sym
{
T 59200 45200 5 10 0 0 90 0 1
value=NoConnection
T 59000 45200 5 10 0 0 90 0 1
device=DRC_Directive
}
N 59600 44700 59600 45100 4
T 59500 45700 9 12 1 0 0 0 1
CS open ==> LiFePO4 3.6V cutoff
N 61800 43200 62100 43200 4
N 62100 43200 62100 41000 4
N 60700 42900 61000 42900 4
N 61000 42900 61000 41000 4
N 57500 44700 58700 44700 4
N 57800 44700 57800 42900 4
N 57800 41300 57800 42300 4
N 59300 44700 59300 46100 4
N 59300 46100 58800 46100 4
C 57900 46000 1 0 0 resistor-1.sym
{
T 58200 46400 5 10 0 0 0 0 1
device=R_1.8k_1%_1608
T 57900 46000 5 10 0 0 180 0 1
footprint=RESC1608N.lht
T 58800 45900 5 10 1 1 180 0 1
refdes=R64
T 58500 46400 5 10 1 1 180 0 1
value=1.8k
}
N 57800 41300 58700 41300 4
C 57300 43800 1 270 1 capacitor-1.sym
{
T 58000 44000 5 10 0 0 90 2 1
device=CAPACITOR
T 58200 44000 5 10 0 0 90 2 1
symversion=0.1
T 57200 44300 5 10 1 1 0 6 1
refdes=C62
T 57300 43800 5 10 0 0 90 2 1
footprint=1206.fp
T 57300 43900 5 10 1 1 0 6 1
value=4.7uF
}
N 57900 46100 57500 46100 4
N 57500 41000 57500 43800 4
N 57800 42600 57200 42600 4
C 57700 46100 1 0 1 Vdd.sym
{
T 57500 46350 5 10 1 1 0 3 1
net=VUNREG:1
}
C 62700 42200 1 270 0 battery-4.sym
{
T 63000 41650 5 8 1 1 270 6 1
pinlabel=-
T 63600 41900 5 10 0 0 270 0 1
device=BATTERY
T 63200 41700 5 10 1 1 0 0 1
refdes=B1
T 64000 41900 5 10 0 0 270 0 1
symversion=0.1
}
C 61800 43300 1 180 0 resistor-1.sym
{
T 61500 42900 5 10 0 0 180 0 1
device=R_0R_1%_1608
T 61800 43300 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 60900 43400 5 10 1 1 0 0 1
refdes=R63
T 61200 42900 5 10 1 1 0 0 1
value=0R0
}
N 60700 42300 62900 42300 4
N 62900 42300 62900 42200 4
N 62900 41400 62900 41000 4
C 57900 48800 1 0 0 vss.sym
C 62400 48700 1 0 0 vss.sym
C 62400 51400 1 0 0 vss.sym
C 62400 50500 1 0 0 vss.sym
C 62400 53200 1 0 0 vss.sym
C 59500 56100 1 0 0 vss.sym
C 60000 55600 1 0 0 vss.sym
C 59100 55200 1 0 0 vss.sym
C 61200 55500 1 0 0 vss.sym
C 62400 54400 1 0 0 vss.sym
N 58800 56400 59600 56400 4
C 52000 55200 1 0 0 vss.sym
C 45000 55200 1 0 0 vss.sym
C 57600 55000 1 0 0 vss.sym
C 45300 52700 1 0 0 vss.sym
C 41200 47400 1 0 0 vss.sym
C 42100 44900 1 0 0 vss.sym
C 42100 43400 1 0 0 vss.sym
C 42100 42500 1 0 0 vss.sym
C 42100 40400 1 0 0 vss.sym
C 48100 42500 1 0 0 vss.sym
C 49300 48700 1 0 0 vss.sym
C 40600 48600 1 0 0 vss.sym
C 42100 39500 1 0 0 vss.sym
N 41000 47700 41300 47700 4
N 58000 49100 58000 49500 4
C 41800 39200 1 0 0 vss.sym
C 59800 40700 1 0 0 vss.sym
C 50400 47100 1 0 0 resistor-1.sym
{
T 50700 47500 5 10 0 0 0 0 1
device=2013M R 22 1%
T 50400 47100 5 10 0 0 180 0 1
footprint=RESC1608N.lht
T 51200 47000 5 10 1 1 180 0 1
refdes=R29
T 51000 47500 5 10 1 1 180 0 1
value=22
}
N 49300 47200 50400 47200 4
C 46700 53700 1 90 0 resistor-1.sym
{
T 46300 54000 5 10 0 0 90 0 1
device=R_22.0_1%_1608
T 46400 53700 5 10 1 1 90 0 1
refdes=R22
T 46900 54300 5 10 1 1 90 0 1
value=22
T 46700 53700 5 10 0 0 90 0 1
footprint=RESC1608N.lht
T 46700 53700 5 10 0 0 90 0 1
description=Res thick 22.0 1% 1608
}
T 42500 53800 9 12 1 0 0 0 1
Add LED
B 50300 52800 5200 4800 3 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 53200 56600 1 180 0 resistor-1.sym
{
T 52900 56200 5 10 0 0 180 0 1
device=R_15_1%_1608
T 53200 56600 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 52400 56600 5 10 1 1 0 0 1
refdes=R8
T 53000 56300 5 10 1 1 0 0 1
value=15
}
C 53400 55700 1 180 0 resistor-1.sym
{
T 53100 55300 5 10 0 0 180 0 1
device=R_15_1%_1608
T 53400 55700 5 10 0 0 0 0 1
footprint=RESC1608N.lht
T 52600 55700 5 10 1 1 0 0 1
refdes=R7
T 53200 55400 5 10 1 1 0 0 1
value=15
}
