#!/bin/bash
# application can be gsm mpeg2 etc...
applic=$1
file=$2
interval=$3
screenfile=screenout_nbody.txt

if [ -z "$file" ]
then
	echo -e "\n Currently/recently running file from $screenfile will be plotted..." 
	cfile=`cat $screenfile | grep "unzipfile is" | tail -1 | awk '{print $3}'`
	cfile=${cfile/%.txt/}
	file=$cfile"_lz.txt"
	processed=`cat $screenfile | grep "unzipfile is" | wc -l`
	let processed=$[$processed -1]
	toprocess=`ls -Sr | grep "_dcc_profile.txt.gz" | wc -l `
	echo -e "\n No of zip files processed = $processed out of $toprocess"
	echo -e "\n Plotting File $file..." 
fi

# serial	c 	l 	lz_index	normalize_lz_index

if [ -z "$interval" ]
then
    interval=5
fi

(
    echo "set title \"Real-Time LZ Complexity\""
    echo "set xlabel \"Time (kSamples)\""
    echo "set ylabel \"LZ Complexity (normalized)\""
    echo "plot \"$file\" using 3:4 title \"without epsilon\" with linespoints, \"$file\" using 3:5 title \"with epsilon\" with linespoints"
    while true; do 
        echo pause $interval; 
        echo reread;
        echo replot; 
        sleep $interval; 
    done
) | gnuplot -persist
