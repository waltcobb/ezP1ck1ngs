#!/bin/bash


cat $1/services.txt | awk '{$1=$2=$3=""; print $0}' | awk 'NF' | cut -d '(' -f 1 | cut -d ' ' -f 4- | grep "[A-Za-z]" | grep [0-9] > $1/.searchsploit.txt

while read line;do searchsploit "$line" ;done < $1/.searchsploit.txt > $1/dirtyPossibleSploits.txt

cat $1/dirtyPossibleSploits.txt | sed '/Exploit Title/d' | sed '/^ *$/d' | sed '/--------------/d' | sed '/^ /'d > $1/possibleSploits.txt 

rm $1/dirtyPossibleSploits.txt

#| grep \| | cut -d '|' -f 1 | sed '/Exploit Title/d' | sed '/^ *$/d' > $1/possibleSploits.txt
