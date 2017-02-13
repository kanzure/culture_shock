###############################################################################
#
#	gEDA Project
#
###############################################################################
# myropcb: targets myropcb 
# and hackvana: targets hackvana-zip 
# change the naming of RS274X files to match
# how the fabs want them.

#PHONY make does not create a file of this name, the name is placeholder for other files.
#PHONY targets have an action every time if targets are scripts.

.PHONY: myropcb hackvana gerbv net pcb gschem bom drc

BASENAMES = micropulser kvboard g30pulser
BOARDS = $(addsuffix .lht, $(BASENAMES))
SCHEMS = $(addsuffix .sch, $(BASENAMES))
NETS = $(addsuffix .net, $(BASENAMES))
CMDS = $(addsuffix .lht.cmd, $(BASENAMES))
DRCS = $(addsuffix .drc, $(BASENAMES))
BOMS =   $(addsuffix .bom.tsv,  $(BASENAMES))
REV = 0.1
GRB = ./fab

bom: $(BOMS)

#this automatic target maker is not good for schematics with more than one page.
$(BOMS): %.bom.tsv: %.sch
	gnetlist -g partslist3 $< -o $@
	libreoffice --calc --infilter=generic_Text $@ &
#	a2ps -B  --borders=0  -f 10 --columns=1 -T 22 --center-title="Bill of Materials $(basename $(basename $@))" $@ -o -  |  ps2pdf - > $@.pdf
#	evince $@.pdf &
#	a2ps -B    #no headers
#	a2ps --right-title=culture shock electroporator project   #set rt header only has 8 chars of room....



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
	gvim  $@


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
	gerbv $(GRB)/$(PROJECTNAME)_rev-$(REV).top $(GRB)/$(PROJECTNAME)_rev-$(REV).top-silk  $(GRB)/$(PROJECTNAME)_rev-$(REV).top-soldermask $(GRB)/$(PROJECTNAME)_rev-$(REV).bot $(GRB)/$(PROJECTNAME)_rev-$(REV).bot-silk  $(GRB)/$(PROJECTNAME)_rev-$(REV).bot-soldermask $(GRB)/$(PROJECTNAME)_rev-$(REV).outline $(GRB)/$(PROJECTNAME)_rev-$(REV).bot-paste $(GRB)/$(PROJECTNAME)_rev-$(REV).top-paste


hackvana:
	if test -d $(GRB); then echo $(GRB)" dir exists"; else mkdir $(GRB); fi
	cp $(PROJECTNAME).lht  $(PROJECTNAME)_rev-$(REV).lht
	pcb -x gerber  --all-layers $(PROJECTNAME)_rev-$(REV).lht                         #give the zip file a rev number
	sleep 1
	mv $(PROJECTNAME)_rev-$(REV).bottom.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gbl
	mv $(PROJECTNAME)_rev-$(REV).bottomsilk.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gbo
	mv $(PROJECTNAME)_rev-$(REV).bottommask.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gbs
	mv $(PROJECTNAME)_rev-$(REV).top.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gtl
	mv $(PROJECTNAME)_rev-$(REV).topsilk.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gto
	mv $(PROJECTNAME)_rev-$(REV).topmask.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gts
	mv $(PROJECTNAME)_rev-$(REV).plated-drill.cnc $(GRB)/$(PROJECTNAME)_rev-$(REV).drl
	mv $(PROJECTNAME)_rev-$(REV).unplated-drill.cnc $(GRB)/$(PROJECTNAME)_rev-$(REV).NPTH.drl
	mv $(PROJECTNAME)_rev-$(REV).outline.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).gm1
	mv $(PROJECTNAME)_rev-$(REV).bottompaste.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).paste.gbp
	mv $(PROJECTNAME)_rev-$(REV).toppaste.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).paste.gtp
	mv $(PROJECTNAME)_rev-$(REV).fab.gbr $(GRB)/$(PROJECTNAME)_rev-$(REV).fab
	-rm -f $(GRB)/*.zip
	cd $(GRB); zip -9 $(PROJECTNAME)_rev-$(REV).zip *.g?? *.drl

gerbv:
	gerbv $(PROJECTNAME)_rev-$(REV).top 


schems: 
	gschem $(SCHEMS) &




clean:
	rm -f   *~ *# *.log $(PROJECTNAME).new.pcb *.gbr $(PROJECTNAME).cmd $(patsubst %,./%.ps, $(SHEETS))
	rm -rf $(GRB)

