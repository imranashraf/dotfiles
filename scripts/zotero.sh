#! /bin/bash

usage()
{
	echo -e " This script starts zotero"
	echo "Usage:	`basename `"
}

if [ "$#" -gt "1" ]
then
	usage;
	exit
fi

/opt/Zotero_linux-x86_64/zotero
