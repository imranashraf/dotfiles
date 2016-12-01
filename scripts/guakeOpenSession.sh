#!/bin/bash
/usr/bin/guake &
sleep 5
guake -r "General"
guake -n k -r "mcprof" --execute-command='cd /data/repositories/mcprof'
guake -n k -r "QUAD" --execute-command='cd /data/repositories/pinTools/QUAD'
guake -n k -r "QUADv2" --execute-command='cd /data/repositories/pinTools/QUADv2/QUAD'
guake -n k -r "Pincomm" --execute-command='cd /data/repositories/pinTools/PinComm'
guake -n k -r "PincommTest" --execute-command='cd /data/roughWork/mcprof_pincomm_quad'
guake -n k -r "OtherTest" --execute-command='cd /data/roughWork/mcprof_pincomm_quad'
guake -n k -r "MemUsage"

