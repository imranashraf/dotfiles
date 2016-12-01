#!/bin/bash

currDir=`pwd`
fnames=$*
fnamespath=
i=$#

for fname in $fnames;
do
	let i=$i-1
	if [ $i -eq 0 ]
	then
		fnamepath=`readlink -f $fname`
		fnamespath+=$fnamepath
	else
		fnamepath=`readlink -f $fname`
		fnamespath+=$fnamepath
		fnamespath+=","
	fi
done

echo $fnamespath

thunderbird -compose "attachment='$fnamespath'"
