#!/bin/bash

OLDSTR=$1
NEWSTR=$2
EXT=$3

usage()
{
	echo -e " This script opens the specified files with kate"
	echo "Usage:	`basename $0` < file(s) >"
}

if [ "$1" = "" ] 
then
	usage;
	exit
fi

kate $* &> /dev/null &

