#! /bin/bash

#DRIVER=NVIDIA-Linux-x86_64-352.21.run
DRIVER=NVIDIA-Linux-x86_64-352.55.run
DRIVER_DIR=/data/softwares/nvidia/drivers/geforceGT640

usage()
{
    echo -e " This script installs nvidia driver"
    echo "Usage:    `basename $0`"
}

if [ "$1" = "-h" ]
then
    usage;
    exit
fi

echo "stopping lightdm"
sudo service lightdm stop

echo "installing nvidia driver"
sudo $DRIVER_DIR/$DRIVER

echo "rebooting in 3 sec"
sleep 3
sudo reboot
