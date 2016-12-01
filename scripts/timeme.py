#!/usr/bin/python

__author__ = 'iashraf'
import sys
import time
import subprocess
import os

total = len(sys.argv)
cmdargs = str(sys.argv)

fout = open('execTime.out', 'w')

if total < 3:
    print "specify PROG and N (number of times to execute) to calc average."
    print "Usage test.py PROG N"
    sys.exit()

PROG=sys.argv[1]
N=int(sys.argv[2])

print "Python Script to benchmark a program.";
print "PROG = ", PROG
print "N = ", N

start = time.time()
for x in range(0, N):
    os.system(PROG)
end = time.time()

print "Average execution time ", float( (end - start)/N)
print >> fout , "Average execution time ", float( (end - start)/N)

fout.close();
