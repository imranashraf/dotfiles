#! /bin/bash

FILE=$1

usage()
{
    echo "Prints and copies the path of the specified file to clipboard."
    echo "If no file is specified, path of the current dir is copied to clipboard."
    echo "Usage:    `basename $0` file.txt"
    echo "Usage:    `basename $0`"
}

if [ "$FILE" = "-h" ]
then
    usage;
    exit
fi

if [ "$FILE" = "" ]
then
    path=`readlink -f .`
else
    path=`readlink -f $FILE`
fi

echo $path | awk '{q=p;p=$0}NR>1 { print q } END{ORS = ""; print p}' |  xclip -sel clip
echo $path

