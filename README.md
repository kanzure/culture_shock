##This repository documents how to make an  **electroporator**

Cloning it gives you a project directory for making printed circuits
and related parts of an **electroporator**, a machine for transforming bacterial suspensions in water to become a new GMO.  The **culture shock** electroporator needs some care in using to avoid electrocution hazards -- it may not work out to borrow just some of this project and turn it on -- it really needs its insulating housing to be safe.

**Now to describe the project directory and how to use it.**  You will notice files that end
with .lht or .gvp .sch .bom.  Those hold the primary data to generate pcb fab files, or to reuse the
circuits to make something else with this as a starting point.  

**The schematic representation** of the circuits is in the files ending in **.sch,**
edited with the **gschem program** from the free open source software, (FOSS), 
project called gEDA with howtos here:  http://wiki.evilmadscientist.com/GEDA_Resources  and,  
http://wiki.geda-project.org/geda:documentation 

The **.lht files hold layout data** edited with the **pcb-rnd** FOSS program from here:  
	http://repo.hu/projects/pcb-rnd/	
If it's your first time using pcb or pcb-rnd, start from the begining with this tutorial for **pcb**, which **pcb-rnd** is derived from:  
	http://www.delorie.com/pcb/docs/gs/gs.html
	
To take a *quick look* at the state of things without needing to learn to edit them, you can install the software on a debian testing installation.  It can be easy to start using those schematic and pcb editors -- just give these commands:

```bash
sudo apt-get update
sudo apt-get install geda
sudo apt-get install pcb-rnd
```

then run these commands from the project directory created by cloning the **culture shock** repo:
```bash
pcb-rnd kvboard.lht
pcb-rnd micropulser.lht
gschem kvboard.sch micropulser.sch
```
More docs to come soon.

The repo's .gitignore file is set to skip git tracking of .jpgs (photos) and pdfs (datasheets),
zipped file bundles, so any of them to distribute need to be saved outside the git repo as a zip file 
that unzips into the git repo dirs.

The git repo dirs that could be there to receive images and datasheets include:

culture_shock/photos_protos_tests_simuls  
fab 	.  .  .	  (contains RS274-X gerber output (generated from .lht file and the makefile))

