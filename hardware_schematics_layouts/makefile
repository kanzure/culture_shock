###############################################################################
#
#	gEDA Project
#
###############################################################################
# myropcb: targets myropcb 
# hackvana: targets hackvana-zip 
# change the naming of RS274X files to match
# how the fabs want them.

#PHONY make does not create a file of this name, the name is placeholder for other files.
#PHONY targets have an action every time if targets are scripts.

.PHONY: myropcb hackvana 4pcb 4pcbnames 4pcbzip 4pcbfab gerbvmyro gerbv4pcb net pcb gschem bom drc

BASENAMES = pyflex_f401  kvboard g30pulser
BOARD2FABROOT = kvboard
REV = 0.2
GRB = ./fab
BASENAME2 := $(BOARD2FABROOT).$(REV)
4PCBDIR := 4pcb-$(BOARD2FABROOT)
BOARD2FAB := $(addsuffix .lht, $(BOARD2FABROOT))
BOARDS = $(addsuffix .lht, $(BASENAMES))
SCHEMS = $(addsuffix .sch, $(BASENAMES))
NETS = $(addsuffix .net, $(BASENAMES))
CMDS = $(addsuffix .lht.cmd, $(BASENAMES))
DRCS = $(addsuffix .drc, $(BASENAMES))
BOMS =   $(addsuffix .bom.tsv,  $(BASENAMES))
BOMPDFS =   $(addsuffix .bom.tsv.pdf,  $(BASENAMES))

4pcb:  $(BOARD2FAB)  
	if test -d $(GRB); then echo $(GRB)" dir exists"; else mkdir $(GRB); fi
	if test -d $(GRB)/$(4PCBDIR); then echo $(GRB)" dir exists"; else mkdir $(GRB)/$(4PCBDIR); fi
	rm -f $(GRB)/*$(BOARD2FABROOT)* ; \
	rm -rf  $(GRB)/$(4PCBDIR)/* ; \
	cp  $(BOARD2FAB)  $(GRB)/$(BASENAME2)-4pcb.lht  ; \
	pcb-rnd -x gerber --all-layers  $(GRB)/$(BASENAME2)-4pcb.lht ; \

	mv $(GRB)/$(BASENAME2)-4pcb.outline.gbr $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gm1 ; \
	mv $(GRB)/$(BASENAME2)-4pcb.topsilk.gbr $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gto ; \
	mv $(GRB)/$(BASENAME2)-4pcb.topmask.gbr $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gts ; \
	mv $(GRB)/$(BASENAME2)-4pcb.top.gbr $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gtl ; \

4pcbnames: | 4pcb
4pcbnames: $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.paste.gbp $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.paste.gbo 
4pcbnames:   $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.paste.gtp   $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gbs
4pcbnames:  $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.NPTH.drl  $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.plated.drl 
4pcbnames: $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gbl  $(GRB)/$(4PCBDIR)/fab.$(BASENAME2)-4pcb.fab
4pcbnames: $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.2.sig $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.3.sig

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.2.sig:  $(GRB)/$(BASENAME2)-4pcb.group2.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.3.sig:  $(GRB)/$(BASENAME2)-4pcb.group3.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/fab.$(BASENAME2)-4pcb.fab:  $(GRB)/$(BASENAME2)-4pcb.fab.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gbl:  $(GRB)/$(BASENAME2)-4pcb.bottom.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.paste.gbp:  $(GRB)/$(BASENAME2)-4pcb.bottompaste.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.paste.gbo:  $(GRB)/$(BASENAME2)-4pcb.bottomsilk.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.paste.gtp:  $(GRB)/$(BASENAME2)-4pcb.toppaste.gbr
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.NPTH.drl:  $(GRB)/$(BASENAME2)-4pcb.unplated-drill.cnc
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.plated.drl:  $(GRB)/$(BASENAME2)-4pcb.plated-drill.cnc
	cp $< $@

$(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.gbs:  $(GRB)/$(BASENAME2)-4pcb.bottommask.gbr
	cp $< $@


$(GRB)/$(BASENAME2)-4pcb.unplated-drill.cnc:
	touch $(GRB)/$(BASENAME2)-4pcb.unplated-drill.cnc

$(GRB)/$(BASENAME2)-4pcb.plated-drill.cnc:
	touch  $(GRB)/$(BASENAME2)-4pcb.plated-drill.cnc

$(GRB)/$(BASENAME2)-4pcb.group2.gbr:
	touch $(GRB)/$(BASENAME2)-4pcb.group2.gbr

$(GRB)/$(BASENAME2)-4pcb.group3.gbr:
	touch $(GRB)/$(BASENAME2)-4pcb.group3.gbr

$(GRB)/$(BASENAME2)-4pcb.group5.gbr:
	touch $(GRB)/$(BASENAME2)-4pcb.group5.gbr

4pcbzip:
	zip -9  $(BASENAME2)-4pcb.zip  $(GRB)/$(4PCBDIR)/$(BASENAME2)-4pcb.*
	

4pcbfab: | 4pcb 4pcbnames 4pcbzip

hackvana:
	if test -d $(GRB); then echo $(GRB)" dir exists"; else mkdir $(GRB); fi
	cp $(BOARD2FABROOT).lht  $(BOARD2FABROOT)_rev-$(REV).lht
	pcbr -x gerber  --all-layers $(BOARD2FABROOT)_rev-$(REV).lht                         #give the zip file a rev number
	sleep 1
	mv $(BOARD2FABROOT)_rev-$(REV).bottom.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gbl
	mv $(BOARD2FABROOT)_rev-$(REV).bottomsilk.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gbo
	mv $(BOARD2FABROOT)_rev-$(REV).bottommask.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gbs
	mv $(BOARD2FABROOT)_rev-$(REV).top.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gtl
	mv $(BOARD2FABROOT)_rev-$(REV).topsilk.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gto
	mv $(BOARD2FABROOT)_rev-$(REV).topmask.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gts
	mv $(BOARD2FABROOT)_rev-$(REV).plated-drill.cnc $(GRB)/$(BOARD2FABROOT)_rev-$(REV).drl
	mv $(BOARD2FABROOT)_rev-$(REV).unplated-drill.cnc $(GRB)/$(BOARD2FABROOT)_rev-$(REV).NPTH.drl
	mv $(BOARD2FABROOT)_rev-$(REV).outline.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).gm1
	mv $(BOARD2FABROOT)_rev-$(REV).bottompaste.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).paste.gbp
	mv $(BOARD2FABROOT)_rev-$(REV).toppaste.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).paste.gtp
	mv $(BOARD2FABROOT)_rev-$(REV).fab.gbr $(GRB)/$(BOARD2FABROOT)_rev-$(REV).fab
	-rm -f $(GRB)/*.zip
	cd $(GRB); zip -9 $(BOARD2FABROOT)_rev-$(REV).zip *.g?? *.drl


bom: $(BOMS)

#this automatic target maker is not good for schematics with more than one page.
$(BOMS): %.bom.tsv: %.sch
	gnetlist -g partslist3 $< -o $@
#	libreoffice --calc --infilter=generic_Text $@ &

pdf: $(BOMPDFS)

$(BOMPDFS): %.bom.tsv.pdf: %.bom.tsv
	a2ps -B  --borders=0  -f 10 --columns=1 -T 25 --center-title="Bill of Materials  $(basename $<)" $< -o -  |  ps2pdf - > $@
	evince $@ &
#	a2ps -B    #no headers



# this explicitly makes boms from  schematics with more than one page:
#	gnetlist -g partslist3 micropulser1.sch 1micropulser2.sch  -o micropulser1micropulser2.bom

net: $(NETS) $(BOMS) $(DRCS)

#this automatic target maker is not good for schematics with more than one page.
$(NETS): %.net: %.sch

	gnetlist -g PCB  $< -o $@

drc: $(DRCS)

#this automatic target maker is not good for schematics with more than one page.
$(DRCS): %.drc: %.sch

	gnetlist -g drc2  $< -o $@


pcb: $(BOARDS)
 $(BOARDS): %.lht: %.sch
	gsch2pcb-rnd  $< -o $@

# this does all $(BOARDS) on each invocation...can be improved...
myropcb: $(BOARDS)  
	if test -d $(GRB); then echo $(GRB)" dir exists"; else mkdir $(GRB); fi
	rm -f $(GRB)/*.zip ; \
	for board in $(BOARDS) ; do \
	cp $$board  $(GRB)/$$board-$@-$(REV).lht ; \
	pcb-rnd -x gerber --all-layers $(GRB)/$$board-$@-$(REV).lht ; \
	mv $(GRB)/$$board-$@-$(REV).outline.gbr $(GRB)/$$board-$@-$(REV).outline ; \
	mv $(GRB)/$$board-$@-$(REV).topsilk.gbr $(GRB)/$$board-$@-$(REV).top-silk ; \
	mv $(GRB)/$$board-$@-$(REV).topmask.gbr $(GRB)/$$board-$@-$(REV).top-soldermask ; \
	mv $(GRB)/$$board-$@-$(REV).top.gbr $(GRB)/$$board-$@-$(REV).top ; \
	mv $(GRB)/$$board-$@-$(REV).group2.gbr $(GRB)/$$board-$@-$(REV).gr2 ; \
	mv $(GRB)/$$board-$@-$(REV).group3.gbr $(GRB)/$$board-$@-$(REV).gr3 ; \
	mv $(GRB)/$$board-$@-$(REV).group5.gbr $(GRB)/$$board-$@-$(REV).gr5 ; \
	mv $(GRB)/$$board-$@-$(REV).bottom.gbr $(GRB)/$$board-$@-$(REV).bot ; \
	mv $(GRB)/$$board-$@-$(REV).bottommask.gbr $(GRB)/$$board-$@-$(REV).bot-soldermask ; \
	mv $(GRB)/$$board-$@-$(REV).bottomsilk.gbr $(GRB)/$$board-$@-$(REV).bot-silk ; \
	mv $(GRB)/$$board-$@-$(REV).plated-drill.cnc $(GRB)/$$board-$@-$(REV).plated.cnc ; \
	mv $(GRB)/$$board-$@-$(REV).unplated-drill.cnc $(GRB)/$$board-$@-$(REV).unplated.cnc ; \
#	mv $(GRB)/$$board-$@-$(REV).fab.gbr $(GRB)/$$board-$@-$(REV).fab.gbr ; \
	mv $(GRB)/$$board-$@-$(REV).bottompaste.gbr $(GRB)/$$board-$@-$(REV).bot-paste ; \
	mv $(GRB)/$$board-$@-$(REV).toppaste.gbr $(GRB)/$$board-$@-$(REV).top-paste ; \
	rm $(GRB)/*.gr3  $(GRB)/*.gr2; zip -9  $(GRB)/$$board-$@-$(REV).zip  $(GRB)/$$board-$@-$(REV).[a-y]* ; \
	done

gerbvmyro:
	gerbv $(GRB)/$(BOARD2FABROOT)_rev-$(REV).top $(GRB)/$(BOARD2FABROOT)_rev-$(REV).top-silk  $(GRB)/$(BOARD2FABROOT)_rev-$(REV).top-soldermask $(GRB)/$(BOARD2FABROOT)_rev-$(REV).bot $(GRB)/$(BOARD2FABROOT)_rev-$(REV).bot-silk  $(GRB)/$(BOARD2FABROOT)_rev-$(REV).bot-soldermask $(GRB)/$(BOARD2FABROOT)_rev-$(REV).outline $(GRB)/$(BOARD2FABROOT)_rev-$(REV).bot-paste $(GRB)/$(BOARD2FABROOT)_rev-$(REV).top-paste




schems: 
	gschem $(SCHEMS) &




clean:
	rm -f   *~ *# *.log 

