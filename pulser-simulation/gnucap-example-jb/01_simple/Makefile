.SUFFIXES: .net .out .hdr .ckt .sim
.PHONY: all simulate clean

SIMNAME = mycircuit

all: simulate

simulate: $(SIMNAME).out
	if [ -f $(SIMNAME).out ]; then if [ -x ./gwave.gw ]; then ./gwave.gw; else gwave $(SIMNAME).out; fi; else echo "No output file!"; fi

clean:
	rm -f $(SIMNAME).out $(SIMNAME).ckt $(SIMNAME).net *.log $(SIMNAME).sch~

$(SIMNAME).out: $(SIMNAME).ckt
	rm -f $(SIMNAME).out
	gnucap -b $(SIMNAME).ckt

$(SIMNAME).net: $(SIMNAME).sch
	gnetlist -g spice -o $(SIMNAME).net $(SIMNAME).sch

$(SIMNAME).ckt: $(SIMNAME).net $(SIMNAME).sim $(SIMNAME).hdr
	echo '* Automatically generated circuit file' >$(SIMNAME).ckt
	echo '* DO NOT MODIFY THIS FILE DIRECTLY, IT IS AUTOMATICALLY GENERATED! Modify the .hdr and .sim files!' >$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
	echo '* Contents of $(SIMNAME).hdr follow: ' >>$(SIMNAME).ckt
	cat $(SIMNAME).hdr >>$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
	echo '* Contents of $(SIMNAME).net follow: ' >>$(SIMNAME).ckt
	tail -n +2 $(SIMNAME).net | head -n -1 >>$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
	echo '* Contents of $(SIMNAME).sim follow: ' >>$(SIMNAME).ckt
	cat $(SIMNAME).sim >>$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
	echo ".ends" >>$(SIMNAME).ckt

