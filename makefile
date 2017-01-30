###############################################################################
#
#	gEDA Project
#
###############################################################################
# myropcb: targets myropcb 
# and hackvana: targets hackvana-zip 
# change the naming of RS274X files to match
# how the fabs want them.

#PHONY targets are targets that have nothing to do with a file of same name.
.PHONY: myropcb hackvana gerbv net pcb 

BOARD1 = micropulser.lht
BOARD2 = kvboard.lht
REV = 0.1
GRB = ./fab

myropcb: $(BOARD1)   $(BOARD2)  
	if test -d $(GRB); then echo $(GRB)" dir exists"; else mkdir $(GRB); fi
	for board in $(BOARD1) $(BOARD2) ; do \
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
	mv $(GRB)/$$board-$@-$(REV).fab.gbr $(GRB)/$$board-$@-$(REV).fab.gbr ; \
	mv $(GRB)/$$board-$@-$(REV).bottompaste.gbr $(GRB)/$$board-$@-$(REV).bot-paste ; \
	mv $(GRB)/$$board-$@-$(REV).toppaste.gbr $(GRB)/$$board-$@-$(REV).top-paste ; \
	rm -f $(GRB)/*.zip ; \
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


edit:
	gschem $(patsubst %,%.sch,$(SHEET)) &


net:
	gnetlist -g drc $(patsubst %,%.sch,$(SHEET)) -o -
	gnetlist -g drc2 $(patsubst %,%.sch,$(SHEET)) -o -
	gnetlist -g PCB $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME).net
	rm -
	echo - make net completed successfully


pcb:
	gsch2pcb --use-files --skip-m4 --elements-dir ../lib/pcb/pi $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME)
#	gnetlist -g gsch2pcb $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME).auto.pcb
#	gnetlist -g pcbpins $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME).cmd

bom:
	gnetlist -g partslist3 $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME)-bom.csv
#	gnetlist -g partslist4 $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME)-bom.csv
#	gnetlist -g bom2 $(patsubst %,%.sch,$(SHEET)) -o $(PROJECTNAME)-bom.csv
	cat $(PROJECTNAME)-bom.csv | a2ps -f 8 --columns=1 -T 25 --center-title="Bill of materials for $(TITLE)" | gs -q -dNOPAUSE -dBATCH -sPAPERSIZE=a4 -sDEVICE=pdfwrite -sOutputFile=$(PROJECTNAME)-bom.pdf -f -


clean:
	rm -f   *~ *# *.log $(PROJECTNAME).new.pcb *.gbr $(PROJECTNAME).cmd $(patsubst %,./%.ps, $(SHEETS))
	rm -rf $(GRB)

