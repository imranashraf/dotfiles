#!/bin/bash
pc="ubi@iashraf.xs4all.nl -p 50001"
cmd="arecord -f dat -D hw:0,0"

ssh -C $pc $cmd | aplay -f dat

