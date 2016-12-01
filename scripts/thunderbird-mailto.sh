#!/bin/sh
# Script to launch thunderbird in the appropriate manner
# when called from FireFox.
# Written by Jarett Stevens
# Firefox configuraton (in about:config): 
# network.protocol-handler.external.mailto boolean true
# network.protocol-handler.app.mailto string /path/thunderbird-mailto.sh


TBIRDBIN=/data/Softwares/thunderbirdLatest/thunderbird/thunderbird
MAILTO=`echo "${1}" | sed -e 's/mailto://g'`

${TBIRDBIN} -remote "ping()"
TBIRDRUNNING=$?

if test ${TBIRDRUNNING} -eq 0 
  then
  ${TBIRDBIN} -remote "mailto(${MAILTO})"
else
  ${TBIRDBIN} -compose "${1}"
fi

