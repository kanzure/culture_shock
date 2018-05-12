#!/usr/bin/python
from __future__ import print_function
# make_PYFLEX_F401.py
import os
import sys
import shutil

# for Py2/3 compatibility
try:
    input = raw_input
except NameError:
    pass # must be using Python 3

import subprocess


this_file_dir = os.path.dirname(os.path.abspath(__file__))
culture_shock_root = os.path.abspath(os.path.join(this_file_dir, '..'))

micropython_git_cmd = 'git clone https://github.com/micropython/micropython.git'
commits_available = {'johns_preferred_commit': '68f4cba3d2aa056f305a20c9e394d4ebf81869ce'
                     }
patch_adc_cmd = 'patch -p1 ./ports/stm32/adc.c < {}/FOR_ADC_DMA__adc.c.patch'.format(culture_shock_root)
dhylands_g30th_board_url = 'https://github.com/dhylands/G30TH.git'
pyflex_board_url = 'https://github.com/jgriessen/PYFLEX_F401.git'
erase_cmd = 'dfu-util -v -s :mass-erase:force -a 0 -d 0483:df11 -D build-PYFLEX_F401/firmware.dfu'
deploy_cmd = 'make BOARD={} deploy'

micropython_dirname = "micropython"
g30th_board_dirname = os.path.split(dhylands_g30th_board_url)[-1].split('.')[0]
pyflex_board_dirname = os.path.split(pyflex_board_url)[-1].split('.')[0]


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--micropython", help="path to micropython git clone dir")
    parser.add_argument("--board", help="pyflex or g30th ONLY (default pyflex)")
    parser.add_argument("--commit", help="which commit/release-tag to clone from micropython's git repo")
    parser.add_argument("--output_dir", help="directory where build/clone(s) occurs")
    parser.add_argument("--patch_adc", help="don't hack the read_timed method, nor add the new method read_timed_stop", action="store_true")
    parser.add_argument("--frozen", help="compile and load 'frozen' modules from the dir passed as arg")
    parser.add_argument("--erase", help='if you need to erase the program area, i.e. if you wrote bad MicroPython code that "bricked" the MCU', action="store_true")
    parser.add_argument("--clean", help='run "make clean" in ports/stm32 first', action="store_true")
    args = parser.parse_args()

    BOARD = 'G30TH' if args.board and args.board.lower() == 'g30th' else 'PYFLEX_F401'

    if args.commit:
        if args.commit not in commits_available:
            print('only commits known to work by culture_shock team are: {}'
                  ' but continuing anyway (v1.9.3 worked for g30th)'.format(commits_available))
            commit_to_use = args.commit
        else:
            commit_to_use = commits_available[args.commit]
    else:
        commit_to_use = commits_available['johns_preferred_commit']

    if args.output_dir:
        if not os.path.isdir(args.output_dir):
            print('provided output_dir does not exist, creating it!')
            os.makedirs(args.output_dir)
        os.chdir(args.output_dir)

    if args.micropython:
        UPYTHON_HOME = args.micropython
        if not os.path.isdir(UPYTHON_HOME):
            print('provided micropython path does not exist!')
            sys.exit(-1)
    else:
        UPYTHON_HOME = "../../" + micropython_dirname

    # only checkout commit/tags or patch, if micropython doesn't exist and we clone it fresh
    if not os.path.isdir(UPYTHON_HOME):
        subprocess.Popen(micropython_git_cmd, shell=True).communicate()
        subprocess.Popen('git checkout {}'.format(commit_to_use), shell=True).communicate()
        
        if args.patch_adc:
            p=subprocess.Popen(patch_adc_cmd, shell=True)
            p.communicate()
            if p.returncode != 0:
                print('patching returncode was {}, resetting git repo with git reset --hard'.format(p.returncode))
                os.chdir(UPYTHON_HOME)
                p=subprocess.Popen('git reset --hard', shell=True)

    os.chdir(UPYTHON_HOME)
    os.chdir(os.path.join('ports', 'stm32'))
    
    if args.clean:
        subprocess.Popen('make clean BOARD={} V=1'.format(BOARD), shell=True).communicate()
        shutil.rmtree('build-{}/firmware.elf'.format(BOARD), ignore_errors=True)

    os.chdir('boards')

    make_returncode = 0
    if not os.path.exists('../build-{}/firmware.elf'.format(BOARD)):
        if BOARD == 'G30TH':
            if not os.path.isdir(g30th_board_dirname):
                subprocess.Popen('git clone {}'.format(dhylands_g30th_board_url), shell=True).communicate()
            os.chdir('..')
            a = input('connect 3.3V to pin B0')
            # run micropython/ports/stm32/Makefile
            make = subprocess.Popen('make BOARD=G30TH', shell=True)
            make.communicate()
        else:
            if not os.path.isdir(pyflex_board_dirname):
                subprocess.Popen('git clone {}'.format(pyflex_board_url), shell=True).communicate()
            os.chdir('..')
            a = input('press SW23 -- boot0 switch, and hold down, press/release SW22 -- reset switch.')
            # run micropython/ports/stm32/Makefile
            if args.frozen:
                make_cmd = 'make -j 2 V=1 BOARD=PYFLEX_F401 FROZEN_MPY_DIR={}'.format(args.frozen)
            else:
                make_cmd = 'make -j 2 V=1 BOARD=PYFLEX_F401'
            make = subprocess.Popen(make_cmd, shell=True)
            make.communicate()
            # workaround for what? I don't know, but it works
            if make.returncode != 0:
                make = subprocess.Popen(make_cmd, shell=True)
                make.communicate()
        make_returncode = make.returncode
    
    if make_returncode != 0:
        print('make failed, culture_shock automation stopping (will not erase MCU or deploy to MCU)')
        sys.exit(-1)
    
    print('!!!!!!!!!!!!! compiled MicroPython for Culture_Shock !!!!!!!!!!!!!')

    if args.erase:
        print('!!!!!!!!!!!!! now attempting to erase MCU memory !!!!!!!!!!!!!')
        subprocess.Popen(erase_cmd, shell=True).communicate()
    print('!!!!!!!!!!!!! now attempting to flash !!!!!!!!!!!!!')
    subprocess.Popen(deploy_cmd.format(BOARD), shell=True).communicate()
