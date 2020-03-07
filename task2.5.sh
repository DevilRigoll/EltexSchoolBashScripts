#!/usr/bin/bash env

echo $1 $2 $3 $4 $5

ed=$(date -d "$4 $5" +%s)
sd=$(date -d "$2 $3" +%s)

funcRes='01'

monthToInt() {
	case "$1" in
		"Jan" ) funcRes='01' ;;
		"Feb" ) funcRes='02' ;;
		"Apr" ) funcRes='03' ;;
		"Mar" ) funcRes='04' ;;
		"May" ) funcRes='05' ;;
		"Jun" ) funcRes='06' ;;
		"Jul" ) funcRes='07' ;;
		"Aug" ) funcRes='08' ;;
		"Sep" ) funcRes='09' ;;
		"Oct" ) funcRes='10' ;;
		"Nov" ) funcRes='11' ;;
		"Dec" ) funcRes='12' ;;
 	 esac
		
}

FILE=/var/log/syslog

while read LINE; do
	if grep -q "$1" <<< "$LINE" ; then
		IFS=' ' read -ra my_array <<< "$LINE"
		monthToInt ${my_array[0]}
		y=$(date +%Y)
		d=$(date -d "$y-$funcRes-${my_array[1]} ${my_array[2]}" +%s)
		if (("$d" >= "$sd")) && (("$d" <= "$ed")) ; then
			echo $LINE
		fi
	fi   
done < $FILE
