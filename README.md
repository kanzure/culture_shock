**This repository documents how to make an electroporator.**

Cloning this repo gives you a project directory for making printed circuits
and related parts of an **electroporator**, a machine for transforming bacterial suspensions in water to become a new GMO.  The **culture shock** electroporator needs some care in using to avoid electrocution hazards -- it may not work out to borrow just some of this project and turn it on -- it really needs its insulating housing to be safe.

**Now to describe the project directory and how to use it.**  You will notice files that end
with .lht or .gvp .sch .bom.  Those hold the primary data to generate pcb fab files, or to reuse the
circuits to make something else with this as a starting point.  

**The schematic representation** of the circuits is in the files ending in **.sch,**
edited with the **gschem program** from the free open source software, (FOSS), 
project called gEDA with howtos here:  http://wiki.evilmadscientist.com/GEDA_Resources  and,  
http://wiki.geda-project.org/geda:documentation 

The **.lht files** hold layout data edited with the **pcb-rnd** FOSS program from here:  
	http://repo.hu/projects/pcb-rnd/	
If it's your first time using pcb or pcb-rnd, start from the begining with this tutorial for **pcb**, which **pcb-rnd** is derived from:  
	http://www.delorie.com/pcb/docs/gs/gs.html
	
To take a *quick look* at the state of things without needing to learn to edit them, you can install the software on a debian testing installation.  It can be easy to start using those schematic and pcb editors -- just give these commands:

```bash
sudo apt-get update
sudo apt-get install geda
sudo apt-get install pcb-rnd
```

then run these commands from the project subdirectory hardware_schematics_layouts created by cloning the **culture shock** repo:
```bash
pcb-rnd kvboard.lht
pcb-rnd micropulser.lht
gschem kvboard.sch micropulser.sch
```
The schematic and netlist and layout tools used are from the gEDA code: http://wiki.evilmadscientist.com/GEDA_Resources#Basics

**Running code on the Culture Shock platform(s)**  
There are two MCU platforms: a board called g30pulser.sch that runs with the micropython platform definition called G30TH, and  a board called micropulser.sch that runs with the micropython platform definition called PYFLEX_F401.  PYFLEX_F401 is not complete now, so compile micropython with platform  G30TH.

To do that, clone https://github.com/micropython/micropython to your home directory and checkout a version tag that is compatible with the age of your code in case new changes to micropython break G30TH code. Next plug a culture shock g30pulser.sch board into USB for power and,

```bash
cd  /home/yourname/micropython/stmhal/boards
git clone    https://github.com/dhylands/G30TH.git
cd ..
make BOARD=G30TH
```

Now the code needs loading by following the instructions in kanzure/culture_shock/micropython_timer_code_lowlevl/micropython_compile_G30TH.txt
Next step depends on which code you want to run, so follow README.md in  kanzure/culture_shock/micropython_timer_code_lowlevl
or  kanzure/culture_shock/micropython_pulser_code as they will be different code and different platforms possibly.
After some testing with the 5 extant g30pulser.sch boards, all activity will switch to using the PYFLEX_F401 platform for 
micropython, which has the same MCU as the G30TH platform, different connectors and fewer signals brought to connectors since it is a targeted application instead of a breakout board.

**Project Module Standard**
Flat flex cables, (FFCs), can be symmetric, their connectors are symmetric, and so connection signal vs. pin number order can be reversed by ordinary use of cables and connectors.  Using symmetric straight through flat flex cables and connectors is the standard for this project because it simplifies early design prototypes by allowing them to lay flat on the bench with component side of all modules up where one can see and probe them.  What symmetric and straight through means by example is: starting with a FFC connector with pins 1 thru 20 with a dot near pin 1 signals connect to another board by going through pin 1 on the first board, straight across without cables being folded or flipped over and into pin 20 of the other board. Pin 2 of the FFC connector on the first board leads to pin 19 on the 2nd, etc.


**Miscellany**  The repo's .gitignore file is set to skip git tracking of .jpgs (photos) and pdfs (datasheets),
zipped file bundles, so any of them to distribute need to be saved outside the git repo as a zip file 
that unzips into the git repo dirs.

The git repo dirs that could be there to receive images and datasheets include:

culture_shock/photos_protos_tests_simuls  
fab 	.  .  .	  (contains RS274-X gerber output (generated from .lht file and the makefile))

