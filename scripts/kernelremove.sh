#! /bin/bash

version=$1
usage()
{
	echo -e " This script removes kernel version specified in the arguments"
	echo "Usage:	`basename $0` < version >"
}

if [ "$#" -lt "1" ]
then
	usage;
	exit
fi

echo "List of installed versions excluding the current in use :"
dpkg -l | tail -n +6 | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r)

image="linux-image-$version-generic"
imageextra="linux-image-extra-$version-generic"
headers="linux-headers-$version"
headersgeneric="linux-headers-$version-generic"

echo "Specified version $version"
echo "Following will be completely removed : "
echo "    $imageextra"
echo "    $image"
echo "    $headers"
echo "    $headersgeneric"

read -p "Do you want to continue(y/n)?" -n 1
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit;
fi


sudo dpkg --purge $image
sudo dpkg --purge $headers
sudo dpkg --purge $headersgeneric

sudo apt-get -f install

