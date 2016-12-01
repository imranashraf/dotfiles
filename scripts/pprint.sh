#! /bin/bash

case "$#" in
0) read line
   ;;
*) line="$*"; 
   ;;
esac

old=$IFS
IFS=' '
printf "%s\n" $line
IFS=$old

