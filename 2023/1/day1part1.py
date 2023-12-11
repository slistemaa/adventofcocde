#!/usr/local/bin/python3
import re

inputfile = "day1input.txt"

def findsum(mylist):
    tmpsum = 0
    for i in mylist:
        res = re.sub("[^0-9]","",i)
        tmpsum += int(res[0]+res[-1])
    return(tmpsum)

if __name__ == '__main__':

    mylist = []
    with open(inputfile) as f:
        mylist = f.readlines()
        mylist = [line.rstrip() for line in mylist]
    res = findsum(mylist)
    print(f"Part One Result: {res}")
