#!/bin/bash
applic=$1
interval=$2
peakMem=0
FirstTime=0

if [ -z "$interval" ]
then
    interval=1      #seconds
fi

while true;
do
    #pid=`pidof -x $applic`
    pid=`pidstat | grep $applic | awk '{print $4}'`

    if [ -z "$pid" ]
    then
        #echo "Overall Peak Mem = $peakMem KB"
        if [ "$FirstTime" -eq 0 ]
        then
            echo "Specified Program not running"
        fi
        FirstTime=1
        peakMem=0
    else
        FirstTime=0
        temp=`grep VmHWM /proc/${pid}/status | awk '{print $2}'`

        if [ "$temp" -gt "$peakMem" ]
        then
            peakMem=$temp
        fi

        if [ "$peakMem" -gt 1024000 ] #1048576 
        then
            #memGB=`echo "$peakMem/1024/1024" | bc -l`
            memGB=`python -c "print ${peakMem}/1024/1024.0"`
            printf 'Current Peak Mem = %.2f GB\n' $memGB

        elif [ "$peakMem" -gt 1024 ]
        then
            #memMB=`echo " $peakMem / 1024 " | bc -l`
            memMB=`python -c "print ${peakMem}/1024"`
            printf 'Current Peak Mem = %.2f MB\n' $memMB

        elif [ "$peakMem" -lt 1024 ]
        then
            echo "Current Peak Mem = $peakMem KB"
        fi
    fi
    sleep $interval;
done

