#!/bin/bash
applic=$1

pid=`pidof -x $applic`
if [ ! -z "$pid" ]
then
	nprocs=`ps -eo pmem,comm | grep $applic | wc -l `
	if [ "$nprocs" -gt 1 ]
	then
		memPercent=`ps -eo pmem,comm | grep $applic | cut -d " " -f 1 | paste -sd+ | bc`
	else
		memPercent=`ps -eo pmem,comm | grep $applic | cut -d " " -f 1`
	fi
	echo "Memory usage $memPercent%"
else
	echo "Specified Program not running"
fi

