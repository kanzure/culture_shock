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

.PHONY: myropcb board1 board2      gerbvmyro gerbv4pcb net pcb gschem bom drc

BASENAMES = kvboard g30pulser pyflex_f401  
MULTIPAGENAMES = pyflex_f401  pyflex_f401_boost
MULTIPAGEOUTNAME = pyflex_f401_all
BOARDFABROOT1 = kvboard
BOARDFABROOT2 = pyflex_f401
REV = 0.5
GRB = ./fab
BASENAME := $(BOARDFABROOT1).$(REV)
4PCBDIR := 4pcb-$(BOARDFABROOT1)
BOARD2FAB := $(addsuffix .lht, $(BOARDFABROOT1))
BOARDS = $(addsuffix .lht, $(BASENAMES))
SCHEMS = $(addsuffix .sch, $(BASENAMES))
NETS = $(addsuffix .net, $(BASENAMES))
CMDS = $(addsuffix .lht.cmd, $(BASENAMES))
DRC = $(addsuffix .drc, $(BASENAMES)) #  $(addsuffix .drc, $(MULTIPAGENAMES))
DRCS = $(addsuffix .drc, $(MULTIPAGEOUTNAME))
BOMS =   $(addsuffix .bom.tsv,  $(BASENAMES))
BOMPDFS =   $(addsuffix .bom.tsv.pdf,  $(BASENAMES))


# $(BOARDFABROOT1).lht   --gerberfile=$(BOARDFABROOT1)-v$(REV)

board1: 
	if test -d $(GRB); then echo $(GRB)" dir exists"; else mkdir $(GRB); fi
	cp $(BOARDFABROOT1).lht   $(GRB)/$(BOARDFABROOT1)-v$(REV).lht
	cd $(GRB)
	pcb-rnd -x gerber  --all-layers  --name-style hackvana  --verbose  $(GRB)/$(BOARDFABROOT1)-v$(REV).lht
	sleep 1
	zip -9 $(GRB)/$(BOARDFABROOT1)-v$(REV).zip   $(GRB)/$(BOARDFABROOT1)-v$(REV).g??  $(GRB)/$(BOARDFABROOT1)-v$(REV).cnc  $(GRB)/$(BOARDFABROOT1)-v$(REV).*drl


pdf: $(BOMPDFS)

$(BOMPDFS): %.bom.tsv.pdf: %.bom.tsv
	a2ps -B  --borders=0  -f 10 --columns=1 -T 25 --center-title="Bill of Materials  $(basename $<)" $< -o -  |  ps2pdf - > $@
	evince $@ &
#	a2ps -B    #no headers



# this explicitly makes boms from  schematics with more than one page:
#	gnetlist -g partslist3  $(MULTIPAGENAMES)  -o $(MULTIPAGEOUTNAME)

drc: $(DRC)

$(DRC): %.drc: %.sch

	gnetlist -g drc2  $< -o $@


bom: $(BOMS)

$(BOMS): %.bom.tsv: %.sch
	gnetlist -g partslist3 $< -o $@


net: $(NETS) $(BOMS) $(DRC)

$(NETS): %.net: %.sch

	gnetlist -g PCB  $< -o $@




# this explicitly makes nets from  schematics with more than one page:
#	gnetlist -g PCB  $(MULTIPAGENAMES)  -o $(MULTIPAGEOUTNAME)


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
	gerbv $(GRB)/$(BOARDFABROOT1)_rev-$(REV).top $(GRB)/$(BOARDFABROOT1)_rev-$(REV).top-silk  $(GRB)/$(BOARDFABROOT1)_rev-$(REV).top-soldermask $(GRB)/$(BOARDFABROOT1)_rev-$(REV).bot $(GRB)/$(BOARDFABROOT1)_rev-$(REV).bot-silk  $(GRB)/$(BOARDFABROOT1)_rev-$(REV).bot-soldermask $(GRB)/$(BOARDFABROOT1)_rev-$(REV).outline $(GRB)/$(BOARDFABROOT1)_rev-$(REV).bot-paste $(GRB)/$(BOARDFABROOT1)_rev-$(REV).top-paste




schems: 
	gschem $(SCHEMS) &




clean:
	rm -f   *~ *# *.log 

