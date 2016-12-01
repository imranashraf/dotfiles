#! /bin/bash

###################################################################
#	A simple bash script to monitor memory usage of an application
#	
#	Written by Imran Ashraf (I.Ashraf@TUdelft.nl)
#
#	Usage:
#		./memonitor <ProgToMonitor> [ <SampleInterval> <MemLimit>]
#
###################################################################

PROGRAM=$1
PID=`pidof $PROGRAM`

INTERVAL=$2
MEMLIMIT=$3

if [ -z "$PROGRAM" ]
then
	echo "No Program specified"
	exit;
fi

if [ -z "$PID" ]
then
	echo "Program $PROGRAM is not running"
	exit;
fi

if [ -z "$INTERVAL" ]
then
    INTERVAL=5		#in seconds
fi

if [ -z "$MEMLIMIT" ]
then
    MEMLIMIT=70		#in percentage
fi

echo "This script will monitor $PROGRAM for Memory Limit of $MEMLIMIT%"

while true;
do
	memFloat=`ps aux | grep $PROGRAM | grep "Rl+" | awk '{print $4}'`
	#echo $memFloat
	
	mem=${memFloat/.*}

	sleep $INTERVAL;

	if [ "$mem" -ge "$MEMLIMIT" ]
	then
		echo "The Program $PROGRAM has exceeded the set limit of $MEMLIMIT ";
		echo "Killing $PROGRAM"
		kill $PID
		break;
	fi

done


