#!/usr/bin/env bash

#clear
touch ./script_log.txt
touch ./script_log_cut.txt
top -b 1> ./script_log.txt &
while true ; do
	sleep 1
	clear
	
	cat ./script_log.txt | head -n6
	
	cat ./script_log.txt | head -n7 | tail -n1 | gawk -F ' ' '{print $1 "\t", $8 "\t", $9 "\t", $10 "\t", "TIME_WORKING" "\t", "APPLICATION_NAME"}'
	cat ./script_log.txt | head -n23 | tail -n16 | gawk -F ' ' '{print $1 "\t", $8 "\t", $9 "\t", $10 "\t", $11 "\t", $12}' 
done

rm ./script_log.txt

jbs=(`ps al | grep top | gawk -F ' ' '{print $3}'`)
	for job in ${jbs[*]} ; do
		kill -15 $jbs
	done

