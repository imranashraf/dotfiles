#!/bin/bash
ATTACH=
SUBJ="process complete"
RECIVER="iimran.aashraf@gmail.com"
MACHINE=`uname -n`
MESG="process complete on the $MACHINE machine \n"
echo "Sending Email ..."
echo -e "$MESG" | mail -s "$SUBJ" "$RECIVER" 
#echo -e "$MESG" | mail -a ${ATTACH} -s ${SUBJ} ${RECIVER}

