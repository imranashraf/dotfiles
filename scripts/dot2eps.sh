#!/bin/sh

dotfile=$1
epsfile=${dotfile%%.dot}.eps
cat $dotfile | dot -Teps -o $epsfile

