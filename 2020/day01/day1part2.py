#!/usr/bin/python

res = 2020
inputfile = "day1input.txt"

def findMatch(mylist, res):
    for x in mylist:
        for y in mylist:
            for z in mylist:
                if x + y + z == res:
                    return(x,y,z)

if __name__ == '__main__':

    mylist = []
    with open(inputfile) as f:
        mylist = [int(x) for x in f.read().split()]
    (n1,n2,n3) = findMatch(mylist,res) 

    fin = n1 * n2 * n3
    print("Final: "+str(fin))
