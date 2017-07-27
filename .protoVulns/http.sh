#!/bin/bash

isCF=false
isWP=false
mkdir $1/site

if (curl -s --head http://$1/CFIDE/administrator/ | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null) ;then
	isCF=true
	echo $1 'is running coldfusion'
fi

if (curl -s --head http://$1/wp-admin | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null) ;then 
	isWP=true
	echo $1 'is running wordpress'	
fi

if $isCF ;then
	echo '---Testing' $1 'for cve2010-2861, results in '$1'/site/coldFusionInfo.txt'
	nmap --script=http-vuln-cve2010-2861 -Pn $1 > $1/site/coldFusionInfo.txt 
fi

if $isWP ;then
	echo '---Running wpscan on' $1 'results in' $1 '/site/wpscan.txt'
	wpscan $1 > $1/site/wpscan.txt
	echo '---Attempting to get wordpress version, results in' $1 '/site/wpVersion.txt'
	curl -s $1/readme | grep Version | awk '{print $4}' > $1/site/wpVersion.txt
fi






