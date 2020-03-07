#!/usr/bin/env bash

echo "Enter place for directorias"

read

for ((i = 0; i < 50; i++))
do
   mkdir $REPLY/d${i}	
   for ((j = 0; j < 100; j++))
   do
      mkdir $REPLY/d${i}/d${j}
      for ((k = 0; k < 200; k++))
      do
         touch $REPLY/d${i}/d${j}/f${k}
      done
   done
done

echo "Ready!!!"
