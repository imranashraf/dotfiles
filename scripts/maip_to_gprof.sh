#!/bin/bash

#echo "kernel                         contribution"
# cat $1 | grep  \\\(Contrib\\\|Function\\\) | cut -d ':' -f 2 | sed 's/ //g' | sed 'N; s/\n/ /'| awk '{printf "%-32s%5.2f\n",$1,$2*100}' | sort -k 2,2  -g -r

#The above lines are commented and modified to the following for PET outpet
cat $1 | grep  \\\(Contrib\\\|Function\\\) | cut -d ':' -f 2 | sed 's/ //g' | sed 'N; s/\n/ /'| awk '{printf "%-32s%5.2f\n",$1,$2*100}' | sort -k 2,2  -g -r | grep -v "Out_of_the_main_function_scope"
