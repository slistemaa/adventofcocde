#!/usr/bin/python

inputfile = "day1input.txt"

def listcount(mylist):
    x = 3
    tmpcount = 0
    while x < len(mylist):
	tmpsum1 = mylist[x-3] + mylist[x-2] + mylist[x-1]
	tmpsum2 = mylist[x] + mylist[x-1] + mylist[x-2]
        if tmpsum2 > tmpsum1:
            tmpcount += 1
        x += 1 
    return(tmpcount)

if __name__ == '__main__':

    mylist = []
    with open(inputfile) as f:
        mylist = [int(x) for x in f.read().split()]
    res = listcount(mylist)
    print(res)
