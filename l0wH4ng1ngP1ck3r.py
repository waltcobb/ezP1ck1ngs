#!/usr/bin/python2.7
from multiprocessing import Process
import subprocess
import argparse
import sys
import os

#cli options
parser = argparse.ArgumentParser()
parser.add_argument('ip', nargs='+', help='targets')
arg = parser.parse_args()


#checks if dir exists, if not, creates it
def makeDir(name):
	if not os.path.exists(name):
		os.makedirs(name)

#makes dirs for targets and subdir 'scans' for each
def prepScans():
	for targets in arg.ip:
		makeDir(targets)
		makeDir(targets + '/scans')

def nmap():
	for targets in arg.ip:
		print '[*] Scanning ' + targets
		subprocess.call(['./.l0wh4ngNmap.sh', targets])


prepScans()
nmap()


