#!/bin/bash
applic=$1
interval=$2
peakMem=0
FirstTime=1
currDir=`pwd`

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
        if [ "$FirstTime" -eq 0 ]
        then
            echo "Peak memory usage VmHWM $peakMem"
            echo "Peak memory usage VmHWM $peakMem" > ${currDir}/memusageVmHWM.out
            exit
        fi
    else
        FirstTime=0
        temp=`grep VmHWM /proc/${pid}/status | awk '{print $2}'`

        if [ "$temp" -gt "$peakMem" ]
        then
            peakMem=$temp
        fi
    fi
    sleep $interval;
done

