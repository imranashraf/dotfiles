#! /bin/bash

OutFile=out.pdf
InFiles="$*"
usage()
{
	echo -e " This script joins the specified pdf files into one $OutFile"
	echo "Usage:	`basename $0` < file1.pdf file2.pdf [more pdf files] >"
}

if [ "$#" -lt "2" ]
then
	usage;
	exit
fi

if [ -f $OutFile ]; then
    echo "$OutFile file already exists!"
	read -p "Do you want to overwrite(y/n)?" -n 1
	echo ""
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		exit;
	fi
fi

for file in $InFiles
do
	if [ ! -f $file ]; then
		echo "Input file <$file> does not exist"
		exit;
	fi
done

gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$OutFile $InFiles

