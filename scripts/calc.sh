#!/bin/bash

calc=$1

usage()
{
	echo -e " This script performs the specified calculation using bc"
	echo "Usage:	`basename $0` < expression >"
}

if [ "$calc" = "" ] 
then
	usage;
	exit
fi

echo "$calc" | bc -l

