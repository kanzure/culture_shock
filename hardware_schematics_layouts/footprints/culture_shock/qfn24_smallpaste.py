#!/usr/bin/python
# Copyright 2016 by Bdale Garbee, 2017 by John Griessen.  GPLv2
#
# Program to emit PCB footprint for UFQPN48  package used by STM32F401CE
# Pad[x y x y 1000 3 ...] x, y footprint coords are relative to footprint center.
# PCB y coordinate is going *DOWN* the page...it can fool you if expecting Y up.
EdgePadHeelSquare = 4.10	# inside edge of pads to opposite inside edge distance.
EdgePadWidth = 0.28			# Pad metal width.
NumEdgePads = 24		# Integer number of pads around edge of QFN.
EdgePadSoldermaskOpen = 0.58		# width of gap in soldermask or resist over pad
EdgePadHeelSoldermaskOpen = 0.32		# width of gap in soldermask or resist over pad
EdgePadClearance = 0.57		# width of gap between copper and pad.
EdgePadLength = 0.55		# Distance from end to end of pad.
EdgePadHeelLength = 0.4 	# Length end to end of pad heel (rounded inner part).
PadSpacing = 0.65
NumCoreGridDiv = 5			# Symmetry needs an odd number grid around zero.
ViaSize = .635			# Via 25 mils diameter (.635mm dia.)
ViaDrillSize = .381		# Via drill hole 15 mils diameter (.381mm dia.)
CoreGridSize = 3.8		# Grid zone of soldermask openings and paste dots.
CenterPadSquare = 3.70		# Pad lines start EdgePadWidth/2 outside this box.
CenterPadClearance = 0.9	# width of gap between copper and pad.
SilkWidth = 0.26
CoreGridSquare = CoreGridSize/NumCoreGridDiv  	# Size of squares with vias, paste dots..
CenterPasteShrink = 0.16	# Paste is smaller than Pad by CenterPasteShrink * 2.
CenterPasteWidth = CoreGridSquare - (2 * CenterPasteShrink) # Paste is smaller.
EdgePasteShrink = 0.06		# Paste is smaller than Pad by EdgePasteShrink * 2.
EdgePasteWidth = EdgePadWidth - (2 * EdgePasteShrink)
EdgePadHeelStart = (EdgePadHeelSquare/2) + (EdgePadWidth/2)
EdgePadHeelEnd = (EdgePadHeelSquare/2)  + EdgePadHeelLength
EdgePadStart =  (EdgePadHeelSquare/2) + EdgePadHeelLength 
EdgePadEnd =  EdgePadHeelSquare/2 + EdgePadLength - EdgePadWidth/2
PadRowStartCenter = (NumEdgePads/4 - 1) * PadSpacing/2
PadGridSize = (NumCoreGridDiv -1)/2	# Odd number cols, rows around zero.



import sys

# we're going to use the 1/100 of a mil fundamental unit form
def mm2mils100( mm ):
	return int( mm / 25.4 * 1000.0 * 100.0 + 0.5 )

print '# author: Bdale Garbee, John Griessen'
print '# email: john@cibolo.com'
print '# dist-license: GPL 2'
print '# use-license: unlimited'
print '# mm2mils100(CenterPasteWidth) =  ' , mm2mils100(CenterPasteWidth), CenterPasteWidth
print '# EdgePadHeelStart =  ' , mm2mils100(EdgePadHeelStart), EdgePadHeelStart
print '# EdgePadHeelEnd =  ' , mm2mils100(EdgePadHeelEnd), EdgePadHeelEnd
print '# EdgePadStart =  ' , mm2mils100(EdgePadStart), EdgePadStart
print '# EdgePadEnd =  ' , mm2mils100(EdgePadEnd), EdgePadEnd

print 'Element[0x0 "UFQFPN48" "U?" "" 0 0 17000 -17000 0 100 0x0]'
print "("

# center pad under the chip -- usually needs thermal or current vias
print '   Pad[',\
 	mm2mils100(0), \
	mm2mils100(0), \
 	mm2mils100(0), \
	mm2mils100(0), \
	mm2mils100(CenterPadSquare), \
	mm2mils100(CenterPadClearance), \
 	0, \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1),  '"square,nopaste"]'

# vias in the center pad -- center is zero, (python range doesn't include final integer)
for viarow in range (-PadGridSize/2,(PadGridSize/2)+1):
  for viacol in range (-PadGridSize/2,(PadGridSize/2)+1):
    print '   Pin[',\
	mm2mils100(2 * viacol * CoreGridSquare), \
 	mm2mils100(2 * viarow * CoreGridSquare), \
	mm2mils100(ViaSize), \
	2500, \
  	0, \
  	mm2mils100(ViaDrillSize), \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1), ' 0x0002]'

# break pad under chip into a grid to control the resist and paste masks
for viarow in range (-2, 3):
  for viacol in range (-2, 3):
    if (viarow in (-2, 0, 2)) and (viacol in (-2, 0, 2)):
      # copper sub-square with resist over vias
      print '   Pad[',\
	mm2mils100(viacol * CoreGridSquare), \
 	mm2mils100(viarow * CoreGridSquare), \
	mm2mils100(viacol * CoreGridSquare), \
 	mm2mils100(viarow * CoreGridSquare), \
	mm2mils100(CoreGridSquare), \
	0, \
 	0, \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1),  ' "square,nopaste"]'
    else:
      # copper sub-square without resist
      print '   Pad[',\
	mm2mils100(viacol * CoreGridSquare), \
 	mm2mils100(viarow * CoreGridSquare), \
	mm2mils100(viacol * CoreGridSquare), \
 	mm2mils100(viarow * CoreGridSquare), \
	mm2mils100(CoreGridSquare), \
	0, \
	mm2mils100(CoreGridSquare+0.02), \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1), ' "square,nopaste"]'
      # copper dot to control paste mask generation
      print '   Pad[',\
	mm2mils100(viacol * CoreGridSquare), \
 	mm2mils100(viarow * CoreGridSquare), \
	mm2mils100(viacol * CoreGridSquare), \
 	mm2mils100(viarow * CoreGridSquare), \
  	mm2mils100(CenterPasteWidth), \
	0, \
	mm2mils100(CoreGridSquare+0.02), \
	'"%i"' % (NumEdgePads+1),  '"%i"' %  (NumEdgePads+1), ' "square"]'

for edgepadnum in range (1, (NumEdgePads/4)+1):
    # edgepads stepping horizontally
    hpd = mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelStart), \
 	mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelEnd), \
	mm2mils100(EdgePadWidth), \
	mm2mils100(EdgePadClearance), \
	mm2mils100(EdgePadHeelSoldermaskOpen), \
	'"%i"' % ((NumEdgePads*3/4)+1-edgepadnum), '"%i"' % ((NumEdgePads*3/4)+1-edgepadnum)

    #full metal pad heels define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], hpd[1], hpd[2], hpd[3], hpd[4], hpd[5], \
    hpd[6], hpd[7] , hpd[8], '"nopaste"]'

    #full metal pad toes define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], mm2mils100(-EdgePadStart),  hpd[2], \
	mm2mils100(-EdgePadEnd),  hpd[4], hpd[5], mm2mils100(EdgePadSoldermaskOpen), hpd[7] , hpd[8], '"square,nopaste"]'

    #solderpaste pad heels define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], hpd[1], hpd[2], hpd[3], \
    mm2mils100(EdgePasteWidth), hpd[5], hpd[6], hpd[7] , hpd[8], '""]'

    #solderpaste pad toes define the < NumEdgePads*3/4 row:
    print '   Pad[', hpd[0], mm2mils100(-EdgePadStart),  hpd[2], \
	mm2mils100(-EdgePadEnd), mm2mils100(EdgePasteWidth),  hpd[5], \
        hpd[6], hpd[7] , hpd[8], '"square"]'

    #full metal pad heels define the first side row:
    print '   Pad[',  hpd[0], mm2mils100(EdgePadHeelStart), hpd[2], \
    mm2mils100(EdgePadHeelEnd), hpd[4], hpd[5], hpd[6],  \
	'"%i"' % edgepadnum, '"%i"' % edgepadnum, '"nopaste"]'

    #full metal pad toes define the first side row:
    print '   Pad[',  hpd[0], mm2mils100(EdgePadStart), hpd[2], \
	mm2mils100(EdgePadEnd), \
	hpd[4], hpd[5], mm2mils100(EdgePadSoldermaskOpen), '"%i"' % edgepadnum, '"%i"' % edgepadnum, '"square,nopaste"]'

    #solderpaste pad heels define the first side row:
    print '   Pad[',  hpd[0], mm2mils100(EdgePadHeelStart), hpd[2], \
    mm2mils100(EdgePadHeelEnd), mm2mils100(EdgePasteWidth), hpd[5], hpd[6], \
	'"%i"' % edgepadnum, '"%i"' % edgepadnum, '""]'

    #solderpaste pad toes define the first side row:
    print '   Pad[',  hpd[0], mm2mils100(EdgePadStart), hpd[2], \
	mm2mils100(EdgePadEnd), mm2mils100(EdgePasteWidth), \
	hpd[5], hpd[6], '"%i"' % edgepadnum, '"%i"' % edgepadnum, '"square"]'

    # edgepads stepping vertically
    vpd = mm2mils100(EdgePadHeelStart), \
 	mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(EdgePadHeelEnd), \
 	mm2mils100(-PadRowStartCenter + (edgepadnum - 1) * PadSpacing), \
	mm2mils100(EdgePadWidth), \
	mm2mils100(EdgePadClearance), \
	mm2mils100(EdgePadHeelSoldermaskOpen), \
	'"%i"' % (NumEdgePads/2+1-edgepadnum), '"%i"' % (NumEdgePads/2+1-edgepadnum)


    #full metal pad heels define the < NumEdgePads/2  side column:
    print '   Pad[', vpd[0], vpd[1], vpd[2], vpd[3], vpd[4], vpd[5], \
    vpd[6] , vpd[7] , vpd[8], '"nopaste"]'

    #full metal pad toes define the < NumEdgePads/2  side column:
    print '   Pad[', mm2mils100(EdgePadStart),  vpd[1], mm2mils100(EdgePadEnd), \
        vpd[3], vpd[4], vpd[5],  mm2mils100(EdgePadSoldermaskOpen), vpd[7] , vpd[8], '"square,nopaste"]'

   #solderpaste pad heels define the < NumEdgePads/2  side column:
    print '   Pad[', vpd[0], vpd[1], vpd[2], vpd[3], mm2mils100(EdgePasteWidth), \
    vpd[5], vpd[6] , vpd[7] , vpd[8], '""]'

    #solderpaste  pad toes define the < NumEdgePads/2  side column:
    print '   Pad[', mm2mils100(EdgePadStart),  vpd[1], mm2mils100(EdgePadEnd), \
    vpd[3], mm2mils100(EdgePasteWidth),  vpd[5],  \
    mm2mils100(EdgePadSoldermaskOpen), vpd[7] , vpd[8], '"square"]'


    #full metal pad heels define the highest numbered side column:
    print '   Pad[',\
	mm2mils100(-EdgePadHeelStart), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
        vpd[4], vpd[5], vpd[6] ,  \
	'"%i"' % (NumEdgePads+1-edgepadnum), '"%i"' % (NumEdgePads+1-edgepadnum), '"nopaste"]'

    #full metal pad toes define the highest numbered side column:
    print '   Pad[',\
	mm2mils100(-EdgePadStart), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
        vpd[4], vpd[5],  mm2mils100(EdgePadSoldermaskOpen), \
	'"%i"' % (NumEdgePads+1-edgepadnum), '"%i"' % (NumEdgePads+1-edgepadnum), '"square,nopaste"]'

    #solderpaste pad heels define the highest numbered side column:
    print '   Pad[',\
	mm2mils100(-EdgePadHeelStart), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadHeelEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
        mm2mils100(EdgePasteWidth),  vpd[5], vpd[6] ,  \
	'"%i"' % (NumEdgePads+1-edgepadnum), '"%i"' % (NumEdgePads+1-edgepadnum), '""]'

    #solderpaste pad toes define the highest numbered side column:
    print '   Pad[',\
	mm2mils100(-EdgePadStart), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
	mm2mils100(-EdgePadEnd), \
 	mm2mils100(PadRowStartCenter - (edgepadnum - 1) * PadSpacing), \
         mm2mils100(EdgePasteWidth),  vpd[5],  mm2mils100(EdgePadSoldermaskOpen), \
	'"%i"' % (NumEdgePads+1-edgepadnum), '"%i"' % (NumEdgePads+1-edgepadnum), '"square"]'


# silk layer mark for pin one:
print '   ElementArc[',\
	mm2mils100(-PadRowStartCenter - PadSpacing), \
	mm2mils100(EdgePadEnd), \
	' 400 400 0 360 ' , mm2mils100(SilkWidth), ' ]'
print ")"
