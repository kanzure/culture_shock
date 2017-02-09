v 20150930 2
C 37600 38200 0 0 0 title-A-cibolo.sym
{
T 58500 38200 5 10 1 1 0 0 1
file=g30pulser.sch
T 62600 37900 5 10 1 1 0 0 1
drawn-by=John Griessen
T 50800 38000 5 18 1 1 0 0 1
title=Culture Shock G30pulser PCB
T 58700 37900 5 10 1 1 0 0 1
first-pagenum=1
T 59400 37900 5 10 1 1 0 0 1
last-pagenum=1
T 62600 38200 5 10 1 1 0 0 1
rev=0.1    2017-2-9
T 64400 43400 5 18 1 1 270 0 1
title2=Culture Shock G30pulser PCB
}
N 54200 45600 58100 45600 4
{
T 54500 45750 5 10 1 1 180 6 1
netname=PA0
}
N 53800 45900 58100 45900 4
{
T 54300 46050 5 10 1 1 180 6 1
netname=PA1
}
N 57300 46200 58100 46200 4
{
T 57500 46350 5 10 1 1 180 6 1
netname=PA2
}
N 57300 46500 58100 46500 4
{
T 57500 46650 5 10 1 1 180 6 1
netname=PA3
}
N 57300 46800 58100 46800 4
{
T 57500 46950 5 10 1 1 180 6 1
netname=PA4
}
N 57300 47100 58100 47100 4
{
T 57500 47250 5 10 1 1 180 6 1
netname=PA5
}
N 57300 48000 58100 48000 4
{
T 57500 48150 5 10 1 1 180 6 1
netname=PB8
}
N 57300 48300 58100 48300 4
{
T 57500 48450 5 10 1 1 180 6 1
netname=PB9
}
N 58100 49500 56200 49500 4
{
T 56700 49600 5 11 1 1 0 0 1
netname=20V_IN
}
N 58100 49200 57600 49200 4
N 57600 49200 57600 49500 4
C 54900 49800 1 0 0 com.sym
{
T 55150 49950 5 8 1 1 0 3 1
net=com
}
N 54700 50100 58100 50100 4
N 55500 50100 55500 52200 4
C 56800 44100 1 0 0 com.sym
{
T 57050 44250 5 8 1 1 0 3 1
net=com
}
N 58100 44700 57400 44700 4
N 57400 44700 57400 44400 4
N 56900 44400 58100 44400 4
C 51200 40900 1 0 1 header_20_single.sym
{
T 50950 53000 5 10 1 1 0 0 1
refdes=J2
T 50800 53500 5 10 0 0 0 6 1
footprint=header50
T 50800 53900 5 10 0 0 0 6 1
device=HEADER50
T 50800 53270 5 10 0 1 0 6 1
device=header50r
T 50800 53270 5 10 0 1 0 6 1
device=header50r
}
N 51200 51400 54700 51400 4
C 54800 52100 1 0 0 regulator_positive_fixed.sym
{
T 55000 53200 5 10 1 1 0 0 1
value=AP2120N-3.3TRG1
T 55000 53400 5 10 1 1 0 0 1
refdes=U1
T 55000 53000 5 8 1 1 0 0 1
footprint=SOT23
T 55000 54300 5 8 0 0 0 0 1
symversion=3.0
}
N 51200 52600 54900 52600 4
N 51200 52000 56400 52000 4
N 56400 52000 56400 52600 4
N 56100 52600 57300 52600 4
C 56600 51100 1 90 0 capacitor-1.sym
{
T 55900 51300 5 10 0 0 90 0 1
device=CAPACITOR
T 55700 51300 5 10 0 0 90 0 1
symversion=0.1
T 56100 51700 5 10 1 1 0 0 1
refdes=C2
T 56500 51300 5 10 1 1 0 0 1
value=4.7 uF
}
N 56400 51100 56400 50100 4
N 54700 51400 54700 50100 4
N 58100 49800 57600 49800 4
N 57600 49800 57600 50100 4
N 51200 43600 54200 43600 4
N 54200 43600 54200 45600 4
N 53800 45900 53800 44200 4
N 53800 44200 51200 44200 4
N 53600 50800 53600 51400 4
N 52200 50800 51200 50800 4
{
T 52100 50850 5 10 1 1 0 6 1
netname=NRESET
}
C 53200 50800 1 0 1 switch-pushbutton-no-1.sym
{
T 52800 51100 5 10 1 1 180 2 1
refdes=S1
T 52800 51400 5 10 0 0 180 2 1
device=SWITCH_PUSHBUTTON_NO
}
N 53600 50800 53200 50800 4
N 57300 47400 58100 47400 4
{
T 57500 47550 5 10 1 1 180 6 1
netname=PB0
}
N 57300 47700 58100 47700 4
{
T 57500 47850 5 10 1 1 180 6 1
netname=PB1
}
N 55600 45000 58100 45000 4
{
T 57500 45150 5 10 1 1 180 6 1
netname=PC0
}
N 51200 47800 52000 47800 4
{
T 51400 47950 5 10 1 1 180 6 1
netname=PB8
}
N 51200 47200 52000 47200 4
{
T 51400 47350 5 10 1 1 180 6 1
netname=PB9
}
N 55200 45300 58100 45300 4
{
T 57500 45450 5 10 1 1 180 6 1
netname=PC1
}
N 51200 41200 55600 41200 4
{
T 51400 41350 5 10 1 1 180 6 1
netname=PC0
}
N 51200 41800 55200 41800 4
{
T 51400 41950 5 10 1 1 180 6 1
netname=PC1
}
N 55600 45000 55600 41200 4
N 55200 41800 55200 45300 4
C 57500 51100 1 90 0 capacitor-1.sym
{
T 56800 51300 5 10 0 0 90 0 1
device=CAPACITOR
T 56600 51300 5 10 0 0 90 0 1
symversion=0.1
T 57000 51700 5 10 1 1 0 0 1
refdes=C2
T 57400 51300 5 10 1 1 0 0 1
value=0.1 uF
}
N 57300 51100 57300 50100 4
N 57300 52000 57300 52600 4
N 51200 44800 52000 44800 4
{
T 51400 44950 5 10 1 1 180 6 1
netname=PA2
}
N 51200 45400 52000 45400 4
{
T 51400 45550 5 10 1 1 180 6 1
netname=PA3
}
N 51200 46000 52000 46000 4
{
T 51400 46150 5 10 1 1 180 6 1
netname=PA4
}
N 51200 46600 52000 46600 4
{
T 51400 46750 5 10 1 1 180 6 1
netname=PA5
}
T 52100 53800 9 12 1 0 180 0 2
This where a G30_TH 
module connects JP21 - JP40.
C 59400 50500 1 180 0 ffc-zif-20.sym
{
T 59300 43900 5 10 1 1 180 0 1
refdes=J?
}
T 58500 51100 9 12 1 0 0 0 6
ZIF connector pin numbering 
is not connected 1 to 1,
but by signal names.
Connector left pin connects to 
other end connecto right pin 
as a signal goes through FFC cable.
