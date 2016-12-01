#!/bin/bash

duration=10

ssh ubi@iashraf.xs4all.nl -p 50001 arecord -f dat -d $duration -D hw:0,0 test.wav
scp -P 50001 ubi@iashraf.xs4all.nl:/home/ubi/test.wav ~/.
ssh ubi@iashraf.xs4all.nl -p 50001 rm test.wav
aplay ~/test.wav

