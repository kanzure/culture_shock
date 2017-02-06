#!/usr/bin/python
# Copyright 2016 by Bdale Garbee, John Griessen.  GPLv2
#
# Program to emit PCB footprint for UFQPN48  package used by STM32F401CE
# Pad[x y x y 1000 3 ...] x, y footprint coords are relative to footprint center.
#
EdgePadHeelSquare = 6.20	# inside edge of pads to opposite inside edge distance.
EdgePadWidth = 0.28			# Pad metal width.
NumEdgePads = 48		# Integer number of pads around edge of QFN.
EdgePadSoldermaskOpen = 0.381		# width of gap in soldermask or resist over pad
EdgePadClearance = 0.5		# width of gap between copper and pad.
CenterPadClearance = 0.9		# width of gap between copper and pad.
PadHeight = 0.75
EdgePadLength = 0.55		# Distance from end to end of pad.
EdgePadHeelLength = 0.4		# Length end to end of pad heel (rounded inner part).
PadSpacing = 0.50
Overall = 7.30
CtrPadSquare = 5.60		# Pad lines start EdgePadWidth/2 outside this box.
EdgePasteShrink = 0.06		# Paste is smaller than Pad by EdgePasteShrink * 2.
EdgePasteWidth = EdgePadWidth - (2 * EdgePasteShrink)
EdgePadHeelStart = EdgePadHeelSquare/2 + EdgePadWidth/2
EdgePadHeelEnd = EdgePadHeelStart + EdgePadHeelLength
EdgePadEnd =  EdgePadHeelSquare/2 + EdgePadLength - EdgePadWidth/2
PadRowStartCenter = (NumEdgePads/4 - 1) * PadSpacing/2
CoreSquare = 4.75		# Grid zone of soldermask openings and paste dots.
PadGridSize = 2			# Even number + and - cols, rows around zero of ctr pad
				# PadGridSize = 2 gives a 5x5 grid around zero.
EdgePadHeelStart = EdgePadHeelSquare/2+EdgePadWidth



import sys

# we're going to use the 1/100 of a mil fundamental unit form
def mm2mils100( mm ):
	return int( mm / 25.4 * 1000.0 * 100.0 + 0.5 )

print '# author: Bdale Garbee, John Griessen'
print '# email: john@cibolo.com'
print '# dist-license: GPL 2'
print '# use-license: unlimited'

print 'Element[0x0 "QFN36" "" "" 0 0 0 0 0 100 0x0]'
print "("

# center pad under the chip -- usually needs thermal or current vias
print '   Pad[',\
 	mm2mils100(0), \
	mm2mils100(0), \
 	mm2mils100(0), \
	mm2mils100(0), \
	mm2mils100(CtrPadSquare), \
	mm2mils100(CenterPadClearance), \
 	0, \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1),  '"square,nopaste"]'

# vias in the center pad -- center is zero, (python range doesn't include final integer)
for viarow in range (-1,2):
  for viacol in range (-1,2):
    print '   Pin[',\
	mm2mils100(2 * viacol * CoreSquare / 5), \
 	mm2mils100(2 * viarow * CoreSquare / 5), \
	2900, \
	2500, \
  	0, \
  	1500, \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1), ' 0x0002]'

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
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1),  ' "square,nopaste"]'
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
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1), ' "square,nopaste"]'
      # copper spot to control paste mask generation
      print '   Pad[',\
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
	mm2mils100(viacol * CoreSquare / 5), \
 	mm2mils100(viarow * CoreSquare / 5), \
  	1500, \
	0, \
	mm2mils100((CoreSquare)/5), \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1), ' "square"]'

for edgepadnum in range (1, (NumEdgePads/4)+1):
    # edgepads running horizontally
    hpd = mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelStart), \
 	mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelEnd), \
	mm2mils100(EdgePadWidth), \
	mm2mils100(EdgePadClearance), \
	mm2mils100(EdgePadSoldermaskOpen), \
	'"%i"' % ((NumEdgePads*3/4)+1-edgepadnum), '"%i"' % ((NumEdgePads*3/4)+1-edgepadnum)

    #full metal pad heels define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], hpd[1], hpd[2], hpd[3], hpd[4], hpd[5], hpd[6], hpd[7] , hpd[8], '"nopaste"]'

    #full metal pad toes define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], mm2mils100(-EdgePadHeelEnd),  hpd[2], \
	mm2mils100(-EdgePadEnd),  hpd[4], hpd[5], hpd[6], hpd[7] , hpd[8], '"square,nopaste"]'

    #solderpaste pad heels define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], hpd[1], hpd[2], hpd[3], \
    mm2mils100(EdgePasteWidth), hpd[5], hpd[6], hpd[7] , hpd[8], '""]'

    #solderpaste pad toes define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], mm2mils100(-EdgePadHeelEnd),  hpd[2], \
	mm2mils100(-EdgePadEnd), mm2mils100(EdgePasteWidth),  hpd[5], \
        hpd[6], hpd[7] , hpd[8], '"square"]'

    #full metal pad heels define the first side row:
    print '   Pad[',  hpd[0], hpd[1], hpd[2], hpd[3], hpd[4], hpd[5], hpd[6], \
	'"%i"' % edgepadnum, '"%i"' % edgepadnum, '"nopaste"]'

    #full metal pad toes define the first side row:
    print '   Pad[',  hpd[0], mm2mils100(+EdgePadHeelEnd), hpd[2], \
	mm2mils100(+EdgePadEnd), \
	hpd[4], hpd[5], hpd[6], '"%i"' % edgepadnum, '"%i"' % edgepadnum, '"square,nopaste"]'

    # edgepads running vertically
    vpd = mm2mils100(EdgePadHeelStart), \
 	mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(EdgePadHeelEnd), \
 	mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(EdgePadWidth), \
	mm2mils100(EdgePadClearance), \
	mm2mils100(EdgePadSoldermaskOpen), \
	'"%i"' % (NumEdgePads/2+1-edgepadnum), '"%i"' % (NumEdgePads/2+1-edgepadnum)


    #full metal pad heels define the < NumEdgePads/2  side column:
    print '   Pad[', vpd[0], vpd[1], vpd[2], vpd[3], vpd[4], vpd[5], vpd[6], vpd[7] , vpd[8], '"nopaste"]'

    #full metal pad toes define the < NumEdgePads/2  side column:
    print '   Pad[', mm2mils100(EdgePadHeelEnd),  vpd[1], mm2mils100(EdgePadEnd), \
        vpd[3], vpd[4], vpd[5], vpd[6], vpd[7] , vpd[8], '"square,nopaste"]'

    #full metal pad heels define the highest numbered side column:
    print '   Pad[',\
	mm2mils100(-EdgePadHeelStart), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
        vpd[4], vpd[5], vpd[6], \
	'"%i"' % (NumEdgePads+1-edgepadnum), '"%i"' % (NumEdgePads+1-edgepadnum), '"nopaste"]'

    #full metal pad heels define the highest numbered side column:
    print '   Pad[',\
	mm2mils100(-EdgePadHeelEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
        vpd[4], vpd[5], vpd[6], \
	'"%i"' % (NumEdgePads+1-edgepadnum), '"%i"' % (NumEdgePads+1-edgepadnum), '"square,nopaste"]'

print '   ElementArc[',\
	mm2mils100(-2.6), \
	mm2mils100(2.6), \
	'500 500 0 360 1000 ]'
print ")"
