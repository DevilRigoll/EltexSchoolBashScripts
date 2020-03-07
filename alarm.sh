#!/usr/bin/env bash
alarm_script() {
	jbs=(`ps al | grep [m]player | gawk -F ' ' '{print $3}'`)
	for job in ${jbs[*]} ; do
		kill -15 $jbs
	done

	echo "alarm = $1"
	if [ -n "$1" ] ; then
		mplayer -loop 0 $1 &> /dev/null &
	fi
}

alarm_script
echo "enter somethig"
read

alarm_script false




