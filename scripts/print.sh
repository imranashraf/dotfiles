#! /bin/bash

#Printer is the default printer set in bashrc file
FILE=$1

usage()
{
    echo -e " This script prints file on $PRINTER"
    echo "Usage:    `basename $0` file.txt"
}

if [ "$FILE" = "" ]
then
    usage;
    exit
fi

echo "Printing File : $1 On Printer :  $PRINTER"

#scp $FILE iashraf@ce-ws002.et.tudelft.nl:/home/iashraf/scripts_misc/.
#ssh iashraf@ce-ws002.et.tudelft.nl lpr -P $PRINTER /home/iashraf/scripts_misc/$FILE
#ssh iashraf@ce-ws002.et.tudelft.nl rm -rf /home/iashraf/scripts_misc/$FILE

lpr -P $PRINTER $FILE
# rm -rf $FILE

