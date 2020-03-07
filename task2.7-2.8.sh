#!/usr/bin/env bash

#Config file
#use="dd"
#time="8:00"
#copy_path="./"
#copy_obj:
#перечисление файлов в столбец

# $1 - path for config

tm=(`sed '4!D' $1`) 

declare -i h=${tm%%:*}
declare -i m=${tm##*:}

echo $h $m

script_path="$PWD/my_copy.sh"

#пихаем в планировщик задач
echo "DISPLAY=:0
$m $h * * *  $script_path $1" | crontab -

echo "Ready!"


