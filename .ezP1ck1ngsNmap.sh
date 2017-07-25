#!/bin/bash

nmap -sV -Pn $1 > $1/scans/nmap.txt

cat $1/scans/nmap.txt | grep open > $1/services.txt
