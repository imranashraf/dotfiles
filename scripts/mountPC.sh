#! /bin/bash
HOME=~
PORT=22 # default port
usage()
{
    echo "This script mounts/unmounts a machine into ~/tempMnts/"
    echo "Usage:	`basename $0` [option] < machine name >"
    echo "Examples:"
    echo "		`basename $0` -m tri"
    echo "		`basename $0` -u tri"
}

if [ "$#" -lt "2" ]
then
    usage;
    exit
fi

case "$2" in
    tri)
        SERVER=iashraf@mypc:/
        MNTPOINT=$HOME/tempMnts/tri
       ;;
    similde)
        SERVER=iashraf@similde.et.tudelft.nl:/
        MNTPOINT=$HOME/tempMnts/similde
        ;;
    tu)
        SERVER=iashraf1@sftp.tudelft.nl:
        MNTPOINT=$HOME/tempMnts/tu
        ;;
    beagle)
        SERVER=root@192.168.0.202:/
        MNTPOINT=$HOME/tempMnts/beagle
       ;;
    vmrose)
        SERVER=demo@localhost:
        PORT=2225
        MNTPOINT=$HOME/tempMnts/vmrose
        ;;
    vmquant)
        SERVER=demo@localhost:
        PORT=2228
        MNTPOINT=$HOME/tempMnts/vmquant
        ;;
    *)
        usage;
        exit 1
esac

#create mount point if it does not exist
if [ ! -d $MNTPOINT ]
then
    mkdir -p $MNTPOINT
fi

case "$1" in
    -m)
        sshfs -p $PORT $SERVER $MNTPOINT
        ;;
    -u)
        sudo umount $MNTPOINT;
        ;;
    *)
        usage;
        exit 1
esac

