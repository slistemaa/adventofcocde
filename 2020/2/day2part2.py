#!/usr/bin/python

inputfile = "day2input.txt"

if __name__ == '__main__':

    fincount = 0
    file = open(inputfile,"r")
    lines = file.readlines()
    for line in lines:
        entries = line.split()
        (mymin,mymax) = entries[0].split('-')
        mychar = entries[1].replace(':','')
        mypass = entries[2]
        if mypass[int(mymin)-1] == mychar or mypass[int(mymax)-1] == mychar:
            if mypass[int(mymin)-1] == mychar and mypass[int(mymax)-1] == mychar:
                junk = 1
            else:
                fincount = fincount + 1

    print("FINAL "+str(fincount))
