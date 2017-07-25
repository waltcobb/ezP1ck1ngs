#!/bin/bash

mkdir $1/tmp

nmap --script=smb-vuln-ms17-010.nse -Pn $1 > $1/tmp/eternalBlueCheck.txt
sleep 10
nmap --script=smb-vuln-ms08-067.nse -Pn $1 > $1/tmp/ms08-067Check.txt
for file in $(ls $1/tmp);do
	if grep -q VULNERABLE "$1/tmp/$file"; then
		mv $1/tmp/$file $1/possibleSploits
	fi
	done

