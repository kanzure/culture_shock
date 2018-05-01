Table of Contents
=================

* [This repository documents how to make an electroporator.](#this-repository-documents-how-to-make-an-electroporator)
* [Now to describe the project directory and how to use it.](#now-to-describe-the-project-directory-and-how-to-use-it)
* [The schematic representation](#the-schematic-representation)
* [Running code on the Culture Shock platform(s)](#running-code-on-the-culture-shock-platforms)
* [Project Module Standard](#project-module-standard)
* [Using the Device](#using-the-device)
* [Aiding with Development and Debug](#aiding-with-development-and-debug)
* [Miscellany](#miscellany)


## This repository documents how to make an electroporator.

Cloning this repo gives you a project directory for making printed circuits
and related parts of an **electroporator**, a machine for transforming bacterial suspensions in water to become a new GMO.

The **culture shock** electroporator needs some care in using to avoid electrocution hazards -- it may not work out to borrow just some of this project and turn it on -- it really needs its insulating housing to be safe.

## Now to describe the project directory and how to use it.
You will notice files that end with .lht or .gvp .sch .bom.
Those hold the primary data to generate pcb fab files, or to reuse the circuits to make something else with this as a starting point.  

## The schematic representation
of the circuits is in the files ending in **.sch,** edited with the **gschem program** from the free open source software, (FOSS), project called gEDA 
* howtos here: [http://wiki.evilmadscientist.com/GEDA_Resources](http://wiki.evilmadscientist.com/GEDA_Resources)
* and [http://wiki.geda-project.org/geda:documentation](http://wiki.geda-project.org/geda:documentation)

The **.lht files** hold layout data edited with the **pcb-rnd** FOSS program from here:  
	http://repo.hu/projects/pcb-rnd/	
If it's your first time using pcb or pcb-rnd, start from the begining with this tutorial for **pcb**, which **pcb-rnd** is derived from:  
	http://www.delorie.com/pcb/docs/gs/gs.html
	
To take a *quick look* at the state of things without needing to learn to edit them, you can look at image files of the schematics and layout with any browser.
Look in directory hardware_schematics_layouts for these files:  kvboard.lht.png kvboard.sch.png pyflex_f401.sch.png pyflex_f401.lht pyflex_f401_boost.sch.png.
To get ability to zoomin and also edit the schematics and layout, install the software as below on a debian testing installation.  It can be easy to start using those schematic and pcb editors -- just give these commands:

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

## Running code on the Culture Shock platform(s)
There are two MCU platforms:
* a board called g30pulser.sch that runs with the micropython platform definition called G30TH
  * [Instructions to flash MicroPython for the G30TH version of culture_shock are here](DEVELOPER_NOTE.md#flashing-micropython)
  * [Additional notes are here (TODO: compress into a single document)](micropython_STM32F4_coding/micropython_compile_G30TH.txt)
* and a board called pyflex_f401.sch that runs with the micropython platform definition called PYFLEX_F401.
  * PYFLEX_F401 is not complete now, so compile micropython with platform G30TH.
  * Platform definition PYFLEX_F401 is being worked on in November-December 2017, and when ready, new instructions for compiling microptyhon programs for culture shock will be written here.

When you connect the culture_shock USB cable to your computer, it will now appear as a "USB mass storage" device.
Now you can simply copy the Python (.py) files to the "USB mass storage" drive/folder.
* For G30TH based copy the .Py files here: [g30_mcu_code](g30_mcu_code) 


As of October 2017, we will be using the PYFLEX_F401 platform for micropython
* this has the **STM32F401CE** MCU
* voltage converters from USB 5V up to 18VDC
  * and from USB 5V down to lithium iron phosphate battery
    * charging volts between 2.4 and 3.4VDC
* 2 20 pin flat flex connectors to get to the GPIOs, ADCs, battery and com ports of the MCU
* a microUSB C connector for charging
* a microUSB AB connector for development and data logging data transfer
* and an SD card slot
* A 2-wire I2C port can be used with OLED and LCD displays.


 
## Project Module Standard
Flat flex cables, (FFCs), can be symmetric, their connectors are symmetric, and so connection signal vs. pin number order can be reversed by ordinary use of cables and connectors.  Using symmetric straight through flat flex cables and connectors is the standard for this project because it simplifies early design prototypes by allowing them to lay flat on the bench with component side of all modules up where one can see and probe them.  What symmetric and straight through means by example is: starting with a FFC connector with pins 1 thru 20 with a dot near pin 1 signals connect to another board by going through pin 1 on the first board, straight across without cables being folded or flipped over and into pin 20 of the other board. Pin 2 of the FFC connector on the first board leads to pin 19 on the 2nd, etc.

## Using the Device
Learn how to prepare growth media, purify plasmid DNA from bacterial culture, and transform E.Coli with electroporation here in our [Lab Manual](LAB_MANUAL.md)

## Aiding with Development and Debug
See our [Developer's Manual](DEVELOPER_NOTE.md) to get started with GIT and [connecting your oscilloscope to culture_shock](DEVELOPER_NOTE.md#self-test-idea), along with other notes.

## Miscellany
The repo's `.gitignore` file is set to skip git tracking of `.jpg` (photos) and `.pdf` (datasheets) and zipped file bundles, so any of them to distribute need to be saved outside the git repo as a zip file that unzips into the git repo dirs.

The git repo dirs that could be there to receive images and datasheets include:
* [culture_shock/photos_protos_tests_simuls](photos_protos_tests_simuls)
* fab 	.  .  .	  (contains RS274-X gerber output (generated from .lht file and the makefile))

Seeing a preview of markdown files like this README.md helps speed documenation.  This previewer is useful:  [markdown-editor](https://jbt.github.io/markdown-editor/)
