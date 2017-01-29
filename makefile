###############################################################################
#
#	gEDA Project
#
###############################################################################
# myropcb: targets myropcb 
# and hackvana: targets hackvana-zip 
# change the naming of RS274X files to match
# how the fabs want them.



BOARD1=shock_micropulser
BOARD2=shock_kvboard
REV=0.1
GRB=fab

myropcb:
	if test -d ./$(GRB); then echo $(GRB)" dir exists"; else mkdir ./$(GRB); fi
	cp $(BOARD1).lht  $(BOARD1)_rev-$(REV).lht
	pcb -x gerber --all-layers $(BOARD1)_rev-$(REV).lht             #give the zip file a rev number
	mv $(BOARD1)_rev-$(REV).outline.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).outline
	mv $(BOARD1)_rev-$(REV).topsilk.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).top-silk
	mv $(BOARD1)_rev-$(REV).topmask.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).top-soldermask
	mv $(BOARD1)_rev-$(REV).top.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).top
	mv $(BOARD1)_rev-$(REV).group2.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).gr2
	mv $(BOARD1)_rev-$(REV).group3.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).gr3
	mv $(BOARD1)_rev-$(REV).group5.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).gr5
	mv $(BOARD1)_rev-$(REV).bottom.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).bot
	mv $(BOARD1)_rev-$(REV).bottommask.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).bot-soldermask
	mv $(BOARD1)_rev-$(REV).bottomsilk.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).bot-silk
	mv $(BOARD1)_rev-$(REV).plated-drill.cnc ./$(GRB)/$(BOARD1)_rev-$(REV).plated.cnc
	mv $(BOARD1)_rev-$(REV).unplated-drill.cnc ./$(GRB)/$(BOARD1)_rev-$(REV).unplated.cnc
	mv $(BOARD1)_rev-$(REV).fab.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).fab.gbr
	mv $(BOARD1)_rev-$(REV).bottompaste.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).bot-paste
	mv $(BOARD1)_rev-$(REV).toppaste.gbr ./$(GRB)/$(BOARD1)_rev-$(REV).top-paste
	-rm -f ./$(GRB)/*.zip
	cd ./$(GRB); rm *.gr3 *.gr2; zip -9 $(BOARD1)_rev-$(REV).zip $(BOARD1)_rev-$(REV).[a-y]*

	cp $(BOARD2).lht  $(BOARD2)_rev-$(REV).lht
	pcb -x gerber --all-layers $(BOARD2)_rev-$(REV).lht             #give the zip file a rev number
	mv $(BOARD2)_rev-$(REV).outline.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).outline
	mv $(BOARD2)_rev-$(REV).topsilk.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).top-silk
	mv $(BOARD2)_rev-$(REV).topmask.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).top-soldermask
	mv $(BOARD2)_rev-$(REV).top.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).top
	mv $(BOARD2)_rev-$(REV).group2.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).gr2
	mv $(BOARD2)_rev-$(REV).group3.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).gr3
	mv $(BOARD2)_rev-$(REV).group5.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).gr5
	mv $(BOARD2)_rev-$(REV).bottom.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).bot
	mv $(BOARD2)_rev-$(REV).bottommask.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).bot-soldermask
	mv $(BOARD2)_rev-$(REV).bottomsilk.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).bot-silk
	mv $(BOARD2)_rev-$(REV).plated-drill.cnc ./$(GRB)/$(BOARD2)_rev-$(REV).plated.cnc
	mv $(BOARD2)_rev-$(REV).unplated-drill.cnc ./$(GRB)/$(BOARD2)_rev-$(REV).unplated.cnc
	mv $(BOARD2)_rev-$(REV).fab.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).fab.gbr
	mv $(BOARD2)_rev-$(REV).bottompaste.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).bot-paste
	mv $(BOARD2)_rev-$(REV).toppaste.gbr ./$(GRB)/$(BOARD2)_rev-$(REV).top-paste
	-rm -f ./$(GRB)/*.zip
	cd ./$(GRB); rm *.gr3 *.gr2; zip -9 $(BOARD2)_rev-$(REV).zip $(BOARD2)_rev-$(REV).[a-y]*

gerbvmyro:
	gerbv ./$(GRB)/$(PROJECTNAME)_rev-$(REV).top ./$(GRB)/$(PROJECTNAME)_rev-$(REV).top-silk  ./$(GRB)/$(PROJECTNAME)_rev-$(REV).top-soldermask ./$(GRB)/$(PROJECTNAME)_rev-$(REV).bot ./$(GRB)/$(PROJECTNAME)_rev-$(REV).bot-silk  ./$(GRB)/$(PROJECTNAME)_rev-$(REV).bot-soldermask ./$(GRB)/$(PROJECTNAME)_rev-$(REV).outline ./$(GRB)/$(PROJECTNAME)_rev-$(REV).bot-paste ./$(GRB)/$(PROJECTNAME)_rev-$(REV).top-paste


hackvana:
	if test -d ./$(GRB); then echo $(GRB)" dir exists"; else mkdir ./$(GRB); fi
	cp $(PROJECTNAME).lht  $(PROJECTNAME)_rev-$(REV).lht
	pcb -x gerber  --all-layers $(PROJECTNAME)_rev-$(REV).lht                         #give the zip file a rev number
	sleep 1
	mv $(PROJECTNAME)_rev-$(REV).bottom.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gbl
	mv $(PROJECTNAME)_rev-$(REV).bottomsilk.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gbo
	mv $(PROJECTNAME)_rev-$(REV).bottommask.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gbs
	mv $(PROJECTNAME)_rev-$(REV).top.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gtl
	mv $(PROJECTNAME)_rev-$(REV).topsilk.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gto
	mv $(PROJECTNAME)_rev-$(REV).topmask.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gts
	mv $(PROJECTNAME)_rev-$(REV).plated-drill.cnc ./$(GRB)/$(PROJECTNAME)_rev-$(REV).drl
	mv $(PROJECTNAME)_rev-$(REV).unplated-drill.cnc ./$(GRB)/$(PROJECTNAME)_rev-$(REV).NPTH.drl
	mv $(PROJECTNAME)_rev-$(REV).outline.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).gm1
	mv $(PROJECTNAME)_rev-$(REV).bottompaste.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).paste.gbp
	mv $(PROJECTNAME)_rev-$(REV).toppaste.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).paste.gtp
	mv $(PROJECTNAME)_rev-$(REV).fab.gbr ./$(GRB)/$(PROJECTNAME)_rev-$(REV).fab
	-rm -f ./$(GRB)/*.zip
	cd ./$(GRB); zip -9 $(PROJECTNAME)_rev-$(REV).zip *.g?? *.drl

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
	rm -rf ./$(GRB)

