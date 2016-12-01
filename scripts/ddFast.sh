#! /bin/bash

in=$1
out=$2
usage()
{
    echo -e " Faster dd with progress"
    echo "Usage:    `basename $0` < input output >"
    echo "Example:  `basename $0` < file.img /dev/sdX >"
    echo "Note: To write to usb/uSD card, make sure to unmount it first by:"
    echo "          umount /dev/sdXN"
}

echo $#

if [ "$#" -lt "2" ]
then
    usage;
    exit
fi

echo "output is $out !"
read -p "Do you want to write(y/n)?" -n 1
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit;
fi

if [ ! -f $in ]; then
    echo "Input file <$in> does not exist"
    exit;
fi

bmaptool create $in > /tmp/image.bmap
sudo bmaptool copy --bmap /tmp/image.bmap $in $out

