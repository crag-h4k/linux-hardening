#!/bin/python
from time import sleep
from subprocess import run, call

procs = ['nano', 'firefox']
cond = True
while cond == True:
    try:
        for proc in procs:
            cmd = 'pkill -f '+ proc
            call(cmd, shell=True)
    except Exception as E:
        print(E)
