#!/bin/bash

OLDSTR=$1
NEWSTR=$2
EXT=$3

usage()
{
	echo -e " This script searches for a string  \n in all the files of a specific extension in the current directory \n and replaces it with new string"
	echo "Usage:	`basename $0` OldStr NewStr Ext"
	echo "Example:	`basename $0` variableA VarA cpp"
}

if [ "$1" = "" ] || [ "$#" != "3" ]
then
	usage;
	exit
fi

for file in *.$EXT;
do
	mv $file $file.old
	sed "s/$OLDSTR/$NEWSTR/g" $file.old > $file
	rm -f $file.old
done
     
