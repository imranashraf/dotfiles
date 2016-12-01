#! /bin/bash

FILE=$1
STYLE=allman

usage()
{
    echo "Restyles the source file to $STYLE"
    echo "Usage:    `basename $0` file.[h/hpp/c/cpp]"
    echo "script also accepts file names with wildcards"
}

if [ "$FILE" = "-h" ]
then
    usage;
    exit
fi

if [ "$FILE" = "" ]
then
    usage;
    exit
else
    #astyle --style=$STYLE $FILE
    #rm -f $FILE.orig
    names=( $@ )
    for file in "${names[@]}"
    do
        echo "Formatting $file"
        astyle --style=$STYLE $file
        rm -f $file.orig
    done
fi

