#!/bin/bash

echo $0

nmap $1 -sV

if (cat $1/scans/nmap.txt | grep 'try -Pn')
	then
		>&2 echo $1 ' is blocking our ping scans, using -Pn'
		nmap $1 -Pn -sV
fi