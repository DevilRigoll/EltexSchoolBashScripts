#!/usr/bin/env bash

DATA=([0]=1 [1]=1 [2]=1 [3]='d@@' [4]='d@@' [5]='f@@' [6]='.')

while [ -n "$1" ]
do
  case "$1" in
	"c1" ) shift ; DATA[0]=$1 ;;
	"c2" ) shift ; DATA[1]=$1 ;;
	"c3" ) shift ; DATA[2]=$1 ;;
	"t1" ) shift ; DATA[3]=$1 ;;
	"t2" ) shift ; DATA[4]=$1 ;;
	"t3" ) shift ; DATA[5]=$1 ;;
	"path" ) shift ; DATA[6]=$1 ;;
  esac
  shift
done


echo ${DATA[@]}

for ((i = 0; i < ${DATA[0]}; i++))
do
   mkdir ${DATA[6]}/${DATA[3]//@@/$i}
   for ((j = 0; j < ${DATA[1]}; j++))
   do
      mkdir ${DATA[6]}/${DATA[3]//@@/$i}/${DATA[4]//@@/$j}
      for ((k = 0; k < ${DATA[2]}; k++))
      do
         touch ${DATA[6]}/${DATA[3]//@@/$i}/${DATA[4]//@@/$j}/${DATA[5]//@@/$k}
      done
   done
done

echo "Ready!!!"
