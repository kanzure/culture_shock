#!/usr/bin/python
# Copyright 2008 by Bdale Garbee <bdale@gag.com>.  GPLv2
#
# Program to emit PCB footprint for QFN36 package used by TI CC1111
#

# dimensions in mm from the TI cc1111f32.pdf datasheet
PinWidth = 0.28		
PinResist = 0.381		# width of gap in solder resist over pad
PinHeight = 0.75
PinSpacing = 0.50
Overall = 6.30
GndSquare = 4.40
CoreSquare = 3.7592		# resist gaps and paste spots over ground tab
PinSquare = 4.80

import sys

# we're going to use the 1/100 of a mil fundamental unit form
def mm2mils100( mm ):
	return int( mm / 25.4 * 1000.0 * 100.0 + 0.5 )

print '# author: Bdale Garbee'
print '# email: bdale@gag.com'
print '# dist-license: GPL 2'
print '# use-license: unlimited'

print 'Element[0x0 "QFN36" "" "" 0 0 0 0 0 100 0x0]'
print "("

# pad under the chip, must be grounded
print '   Pad[',\
 	mm2mils100(0), \
	mm2mils100(0), \
 	mm2mils100(0), \
	mm2mils100(0), \
	mm2mils100(GndSquare), \
	0, \
 	0, \
	'"pin37" "37" "square,nopaste"]'

# vias in the ground pad under the chip
for viarow in range (-1,2):
  for viacol in range (-1,2):
    print '   Pin[',\
	mm2mils100(2 * viacol * CoreSquare / 5), \
 	mm2mils100(2 * viarow * CoreSquare / 5), \
	2900, \
	2500, \
  	0, \
  	1500, \
	'"pin37" "37" 0x0002]'

# break pad under chip into a grid to control the resist and paste masks
for viarow in range (-2, 3):
  for viacol in range (-2, 3):
    if (viarow in (-2, 0, 2)) and (viacol in (-2, 0, 2)):
      # copper sub-square with resist over vias
      print '   Pad[',\
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
	mm2mils100((CoreSquare)/5), \
	0, \
 	0, \
	'"pin37" "37" "square,nopaste"]'
    else:
      # copper sub-square without resist
      print '   Pad[',\
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
	mm2mils100((CoreSquare)/5), \
	0, \
	mm2mils100((CoreSquare)/5), \
	'"pin37" "37" "square,nopaste"]'
      # copper spot to control paste mask generation
      print '   Pad[',\
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
  	1500, \
	0, \
	mm2mils100((CoreSquare)/5), \
	'"pin37" "37" "square"]'

# pins
for pin in range (1,10):
    print '   Pad[',\
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(-Overall/2 + PinWidth/2), \
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(-Overall/2 + PinHeight - PinWidth/2), \
	mm2mils100(PinWidth), \
	mm2mils100(PinSpacing - PinWidth), \
	mm2mils100(PinResist), \
	'"pin%i"' % (28-pin), '"%i"' % (28-pin), '"square"]'

    print '   Pad[',\
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(+Overall/2 - PinHeight + PinWidth/2), \
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(+Overall/2 - PinWidth/2), \
	mm2mils100(PinWidth), \
	mm2mils100(PinSpacing - PinWidth), \
	mm2mils100(PinResist), \
	'"pin%i"' % pin, '"%i"' % pin, '"square"]'

    print '   Pad[',\
	mm2mils100(Overall/2 - PinHeight + PinWidth/2), \
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(Overall/2 - PinWidth/2), \
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(PinWidth), \
	mm2mils100(PinSpacing - PinWidth), \
	mm2mils100(PinResist), \
	'"pin%i"' % (19-pin), '"%i"' % (19-pin), '"square"]'

    print '   Pad[',\
	mm2mils100(-Overall/2 + PinWidth/2), \
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(-Overall/2 + PinHeight - PinWidth/2), \
 	mm2mils100(-2.5 + pin * PinSpacing), \
	mm2mils100(PinWidth), \
	mm2mils100(PinSpacing - PinWidth), \
	mm2mils100(PinResist), \
	'"pin%i"' % (27+pin), '"%i"' % (27+pin), '"square"]'

print '   ElementArc[',\
	mm2mils100(-2.6), \
	mm2mils100(2.6), \
	'500 500 0 360 1000 ]'
print ")"
