#!/usr/local/bin/python3
import re

numlist = ["zero","one","two","three","four","five","six","seven","eight","nine"]
inputfile = "day1input.txt"

def findsum(mylist):
    tmpsum = 0
    for i in mylist:
        found = []
        for x in range(len(i)):
            if x < len(i):
                if i[x].isdigit():
                    found.append(str(i[x]))
                    continue
                else:
                    cutit = i[x:]
                    for j in range(len(numlist)):
                        pattern = "^"+numlist[j]
                        if re.match(pattern,cutit):
                            found.append(str(j))
        tmpsum += int(found[0]+found[-1])
    return(tmpsum)

if __name__ == '__main__':

    mylist = []
    with open(inputfile) as f:
        mylist = f.readlines()
        mylist = [line.rstrip() for line in mylist]
    res = findsum(mylist)
    print(f"Part Two result: {res}")
