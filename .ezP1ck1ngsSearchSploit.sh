#!/bin/bash

mkdir $1/links

cat $1/services.txt | awk '{$1=$2=$3=""; print $0}' | awk 'NF' | cut -d '(' -f 1 | cut -d ' ' -f 4- | grep "[A-Za-z]" | grep [0-9] > $1/.searchsploit.txt

cat $1/services.txt | awk '{$1=$2=$3=""; print $0}' | awk 'NF'| cut -d '(' -f 1 | cut -d ' ' -f 4- | sed 's/ /+/g' > $1/.ddg.txt

while read line;do searchsploit "$line" ;done < $1/.searchsploit.txt > $1/dirtyPossibleSploitsList.txt

while read line;do ./.ddg.py "$line"+exploit-db | cut -d = -f 3 | grep exploit-db > $1/links/$line.txt ;done < $1/.ddg.txt

cat $1/dirtyPossibleSploitsList.txt | sed '/Exploit Title/d' | sed '/^ *$/d' | sed '/--------------/d' | sed '/^ /'d > $1/possibleSploitsList.txt 

rm $1/dirtyPossibleSploitsList.txt

mkdir $1/possibleSploits

for sploit in $(cat $1/possibleSploitsList.txt | cut -d '|' -f 2 | cut -d ' ' -f 2);do cp /usr/share/exploitdb/platforms/$sploit $1/possibleSploits ;done
