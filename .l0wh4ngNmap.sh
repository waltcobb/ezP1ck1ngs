#!/bin/bash

nmap $1 -sV > $1/scans/nmap.txt

if (cat $1/scans/nmap.txt | grep 'try -Pn')
	then
		>&2 echo $1 ' is blocking our ping scans, using -Pn'
		nmap $1 -Pn -sV
fi

cat $1/scans/nmap.txt | grep open > services.txt