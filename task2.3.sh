#!/usr/bin/env bash

tm="07:00"
path=""
d=""
echo -n "В какой день вас разбудить? (гггг-мм-дд): "
read d
echo -n "В какое время? (h:mm): "
read tm
echo "Путь кфайлу сигнала"
read path

echo "${tm%%:*} ${tm##*:}"

declare -i h=${tm%%:*}
declare -i m=${tm##*:}


# от намеренного закрытия сонного человека
trap "echo -e '\n No no, enter something && sleep 1 && alarm_start" SIGINT SIGTERM SIGHUP SIGQUIT SIGTSTP SIGSTOP


if [[ "$tm" != [0-9]:[0-9][0-9] ]] && [[ "$tm" != [0-9][0-9]:[0-9][0-9] ]]; then
	echo 'Enter right time. For example: "07:00".' >&2
	exit 10
fi

date=$(date -d "$d $tm" +%s)

# последняя ошибка (если неверная дата)
err=$?
if [[ $err > 0 ]] ; then
	echo 'Установите правильное время. Пример: "07:00".' >&2
	exit $err
fi



#пихаем в планировщик задач
echo "DISPLAY=:0
$m $h * * *  $PWD/alarm.sh $path" | crontab -

# засыпаем
#sudo rtcwake -m mem -t $date

#clear
#echo "For switching off alarm push down enter"

#read

#alarm_start false
