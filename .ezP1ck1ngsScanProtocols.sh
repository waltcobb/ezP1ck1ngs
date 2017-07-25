#!/bin/bash

touch $1/protocols.txt
cat $1/services.txt | awk '{print $1 $3}' | sed 's/\/tcp/ /' > $1/protocols.txt

for vuln in $(cat $1/protocols.txt | cut -d ' ' -f 2);do 
	if [ -e .protoVulns/$vuln.sh ] 
	then 
		./.protoVulns/$vuln.sh $1 
	fi
	done
