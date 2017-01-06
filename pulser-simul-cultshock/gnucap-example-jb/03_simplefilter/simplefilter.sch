v 20080706 1
C 40000 40000 0 0 0 title-B.sym
N 41700 46200 42200 46200 4
N 41700 46200 41700 46800 4
{
T 41100 46900 5 10 1 0 0 0 1
netname=Vin
}
C 43700 46000 1 0 0 opamp-1.sym
{
T 44400 46800 5 10 0 0 0 0 1
device=OPAMP
T 44400 46600 5 10 1 1 0 0 1
refdes=X1
T 44400 47400 5 10 0 0 0 0 1
symversion=0.1
T 43900 45200 5 10 1 0 0 0 1
value=LM324/NS
}
C 44000 46800 1 0 0 vcc-1.sym
C 43400 46700 1 270 0 gnd-1.sym
C 43900 45400 1 0 0 vcc-minus-1.sym
N 44700 46400 46200 46400 4
{
T 45600 46600 5 10 1 0 0 0 1
netname=Vout
}
C 42200 46100 1 0 0 resistor-2.sym
{
T 42600 46450 5 10 0 0 0 0 1
device=RESISTOR
T 42400 46400 5 10 1 1 0 0 1
refdes=R1
T 42700 46400 5 10 1 1 0 0 1
value=500
}
C 44300 44500 1 0 0 resistor-2.sym
{
T 44700 44850 5 10 0 0 0 0 1
device=RESISTOR
T 44500 44800 5 10 1 1 0 0 1
refdes=R2
T 44900 44800 5 10 1 1 0 0 1
value=100k
}
C 44300 43700 1 0 0 capacitor-1.sym
{
T 44500 44400 5 10 0 0 0 0 1
device=CAPACITOR
T 44500 44200 5 10 1 1 0 0 1
refdes=C1
T 44500 44600 5 10 0 0 0 0 1
symversion=0.1
T 44900 44200 5 10 1 1 0 0 1
value=100n
}
N 43100 46200 43700 46200 4
N 43400 44600 44300 44600 4
N 45200 44600 46000 44600 4
N 45200 43900 46000 43900 4
N 46000 43900 46000 46400 4
N 44300 43900 43400 43900 4
N 43400 43900 43400 46200 4
