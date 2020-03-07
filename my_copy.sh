#!/usr/bin/env bash

cmd=(`sed '2!D' $1`)
cmd=${cmd##*=}
param=(`sed '3!D' $1`)
param=${param##*=}
pif=(`sed '5!D' $1`)
pif=${pif##*=}
str_count=(`wc $1 | gawk -F ' ' '{print $1}'`)

case "$cmd" in
	"dd" ) 
		for ((i = 7 ; i <= "$str_count" ; i++ )) do
			pof=(`sed "$i!D" $1`)
	       		dd if=$pif of=$pof $param
		done
	
	;;
	"tar" ) 
		for ((i = 7 ; i <= "$str_count" ; i++ )) do
			pof=(`sed "$i!D" $1`)
			tar $param $pif $pof
		done

	;;
	"git" )
		echo ${param##*;}
		echo ${param%%;*}
		#git config --global user.email ${param##*;}
		#git config --global ${param%%;*}
		git init --separate-git-dir="$pif"
		for ((i = 7 ; i <= "$str_count" ; i++ )) do
			pof=(`sed "$i!D" $1`)
	       		git add "$pof"
		done
		git commit -m "Backup `date`"
	;;
esac
