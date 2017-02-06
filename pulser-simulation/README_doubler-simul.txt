based on a tutorial by Johannes Bauer http://www.johannes-bauer.com/electronics/gnucap/

the examples from his site are in subdirectory gnucap-example-jb

To rerun my simulation first install gnucap and gaw.

gaw waveform viewer is available to compile for Linux here:  http://www.rvq.fr/linux/gaw.php
It probably compiles on Mac also

If you use windows, you need another viewer to use with gnucap. 

Maybe https://sourceforge.net/projects/kjwaves/

Next, from the dir you found this file in, run make to get an out put similar to below:

john@toolbench64 [pulser-simul-cultshock]make
gnetlist -g spice -o voltagedoubler.net voltagedoubler.sch
Loading schematic [voltagedoubler.sch]
echo '* Automatically generated circuit file' >voltagedoubler.ckt
echo '* DO NOT MODIFY THIS FILE DIRECTLY, IT IS GENERATED FROM  the .hdr and .sim files!' >voltagedoubler.ckt
echo >>voltagedoubler.ckt
echo '* Contents of voltagedoubler.hdr follow: ' >>voltagedoubler.ckt
cat voltagedoubler.hdr >>voltagedoubler.ckt
echo >>voltagedoubler.ckt
echo '* voltagedoubler.net COMES FROM RUNNING gnetlist -g spice on voltagedoubler.sch: ' >>voltagedoubler.ckt
tail -n +2 voltagedoubler.net | head -n -1 >>voltagedoubler.ckt
echo >>voltagedoubler.ckt
echo '* Contents of voltagedoubler.sim follow: ' >>voltagedoubler.ckt
cat voltagedoubler.sim >>voltagedoubler.ckt
echo >>voltagedoubler.ckt
rm -f voltagedoubler.dat
gnucap -b voltagedoubler.ckt
Gnucap : The Gnu Circuit Analysis Package
Never trust any version less than 1.0
Copyright 1982-2013, Albert Davis
Gnucap comes with ABSOLUTELY NO WARRANTY
This is free software, and you are welcome
to redistribute it under the terms of 
the GNU General Public License, version 3 or later.
See the file "COPYING" for details.
main version: master 2016-02-02a
core-lib version: master 2016-02-02a
default plugins: master 2016-02-02a
* DO NOT MODIFY THIS FILE DIRECTLY, IT IS GENERATED FROM  the .hdr and .sim files! 

Now you can start gaw like this:

gaw voltagedoubler.dat

Gaw has two windows, so find the smaller one and click-drag on buttons with signal names
to put them in what gaw calls panels.  One signal or 5 can go in one panel.

gaw is a GUI -- I have not found a way to load all the last settings from a script.

But after quickly dragging signal names you get glorious graphs of the data.
