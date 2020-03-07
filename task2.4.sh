#!/usr/bin/env bash

pname=$1
period=$2

echo $pname

while true ; do
	sleep $period
	job=(`ps -al | grep $pname`)
	echo $job
	if [ -z "$job" ] ; then
		$pname
	fi
done


