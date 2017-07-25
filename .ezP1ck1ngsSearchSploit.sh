#!/bin/bash


cat $1/services.txt | awk '{$1=$2=$3=""; print $0}' | awk 'NF' | cut -d ' ' -f 4- | grep "[A-Za-z]" | grep [0-9] > $1/.searchsploit.txt

while read line;do seachsploit "$line" ;done < $1/.seachsploit.txt > $1/possibleSplots.txt

cat $1/possibleSplots.txt | grep \| | cut -d '|' -f 1 | sed -i '/Exploit Title/d' | sed -i '/^ *$/d'