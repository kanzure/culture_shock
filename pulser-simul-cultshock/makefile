.SUFFIXES: .net .dat .hdr .ckt .sim
.PHONY: all waves clean

SIMNAME = voltagedoubler

all:  $(SIMNAME).dat $(SIMNAME).net $(SIMNAME).ckt

waves: $(SIMNAME).dat
	if [ -f $(SIMNAME).dat ]; then  gaw $(SIMNAME).dat; fi; else echo "No output file!"; fi

clean:
	rm -f $(SIMNAME).dat $(SIMNAME).ckt $(SIMNAME).net *.log $(SIMNAME).sch~

$(SIMNAME).dat: $(SIMNAME).ckt
	rm -f $(SIMNAME).dat
	gnucap -b $(SIMNAME).ckt

$(SIMNAME).net: $(SIMNAME).sch
	gnetlist -g spice -o $(SIMNAME).net $(SIMNAME).sch

$(SIMNAME).ckt: $(SIMNAME).net $(SIMNAME).sim $(SIMNAME).hdr
	echo '* Automatically generated circuit file' >$(SIMNAME).ckt
	echo '* DO NOT MODIFY THIS FILE DIRECTLY, IT IS GENERATED FROM  the .hdr and .sim files!' >$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt

	echo '* Contents of $(SIMNAME).hdr follow: ' >>$(SIMNAME).ckt
	cat $(SIMNAME).hdr >>$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
	echo '* $(SIMNAME).net COMES FROM RUNNING gnetlist -g spice on $(SIMNAME).sch: ' >>$(SIMNAME).ckt
	tail -n +2 $(SIMNAME).net | head -n -1 >>$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
	echo '* Contents of $(SIMNAME).sim follow: ' >>$(SIMNAME).ckt
	cat $(SIMNAME).sim >>$(SIMNAME).ckt
	echo >>$(SIMNAME).ckt
#	echo ".ends" >>$(SIMNAME).ckt

