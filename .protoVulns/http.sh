#!/bin/bash

if (curl -s --head http://$1/CFIDE/administrator/ | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null);then 
	nmap --script=http-vuln-cve2010-2861 -Pn $1 > $1/coldFusionInfo.txt 
fi
