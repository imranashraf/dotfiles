#!/bin/bash
applic=$1
interval=$2
peakMem=0

if [ -z "$interval" ]
then
    interval=1      #seconds
fi

while true;
do
    pid=`pidof -x $applic`

    if [ -z "$pid" ]
    then
        #echo "Overall Peak Mem = $peakMem KB"
        echo "Specified Program not running"
        peakMem=0
    else
        temp=`grep VmPeak /proc/${pid}/status | awk '{print $2}'`

        if [ "$temp" -gt "$peakMem" ]
        then
            peakMem=$temp
        fi

        if [ "$peakMem" -gt 1024000 ] #1048576 
        then
            memGB=`echo "$peakMem/1024/1024" | bc -l`
            printf 'Current Peak Mem = %.2f GB\n' $memGB

        elif [ "$peakMem" -gt 1024 ]
        then
            memMB=`echo " $peakMem / 1024 " | bc -l`
            printf 'Current Peak Mem = %.2f MB\n' $memMB

        elif [ "$peakMem" -lt 1024 ]
        then
            echo "Current Peak Mem = $peakMem KB"
        fi
    fi
    sleep $interval;
done

