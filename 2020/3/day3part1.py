#!/usr/bin/python

inputfile = "day3input0.txt"

if __name__ == '__main__':

    fincount = 0
    file = open(inputfile,"r")
    lines = file.readlines()
    for line in lines:
        entries = line.split()
        (mymin,mymax) = entries[0].split('-')
        mychar = entries[1].replace(':','')
        mycount = entries[2].count(mychar)
        if mycount >= int(mymin) and mycount <= int(mymax):
            fincount = fincount + 1
    print("Final count: " + str(fincount))
