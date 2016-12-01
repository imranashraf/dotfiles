#!/bin/bash

# This script is used in conjuction with nautilus py extensions.
# http://www.giuspen.com/nautilus-pyextensions/
# Open Teminal Here is modified to open guake in the current directory,
# or in the selected directory
# Modified version of Open Terminal Here is also availble in this current
# script directory

dirPath=$1
if [ "$dirPath" == "lus-desktop:///" ];
then
    dirPath=Desktop
fi
dirName=`basename $dirPath`

guake -t
guake -n k -r "$dirName" --execute-command="cd '$dirPath'; clear"

