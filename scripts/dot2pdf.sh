#!/bin/sh

dotfile=$1
#pdffile=`basename $dotfile`.pdf
pdffile=${dotfile%%.dot}.pdf
cat $dotfile | dot -Tpdf -o $pdffile

