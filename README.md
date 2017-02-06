This repository documents a project directory for making printed circuits
and related parts of an electroporator, a machine with high voltage that can kill
the casual operator if they treat it like something inherently safe, or as a toy.
That said, with some help from built in safeguards and some lab equipment awareness, it
can be used thousands of times with no worries.  The circuits described here are not
to be used without housings like a break out board -- they need insulation around them to be safe.

Now to describe the project directory and how to use it.  You will notice files that end
with .lht or .gvp .sch .bom.  Those hold the primary data to generate pcb fab files, or to reuse the
circuits to make something else with this as a starting point.  

The schematic representation of the circuits is in the files ending in .sch,
edited with the gschem program from the free open source software, (FOSS), 
project called gEDA with howtos here:  
	http://wiki.evilmadscientist.com/GEDA_Resources
	http://wiki.geda-project.org/geda:documentation

The .lht files hold layout data edited with the pcb-rnd FOSS program from here:
	http://repo.hu/projects/pcb-rnd/	
but it is good to start from the begining with this tutorial for pcb, which pcb-rnd is derived from:
	http://www.delorie.com/pcb/docs/gs/gs.html
	
To take a look at the state of things without even learning how to edit, you can quickly
install the software on a debian mahcine with these commands:

sudo apt-get update
sudo apt-get install geda
sudo apt-get install pcb-rnd

then run these commands:
pcb-rnd kvboard.lht
pcb-rnd micropulser.lht
gschem kvboard.sch micropulser.sch

More docs to come soon.

The .gitignore file is set to skip git tracking of .jpgs (photos) and pdfs (datasheets),
zipped file bundles, so any of them to distribute need to be saved outside the git repo as a zip file 
that unzips into the git repo dirs.

The git repo dirs that could be there to receive unzipping include:

culture_shock/photos_protos_tests_simuls
fab 			# contains RS274-X gerber output (generated from .lht file and the makefile)

