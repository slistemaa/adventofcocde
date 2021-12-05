#!/usr/bin/python

inputfile = "day2input.txt"

def dopath(tmplist):   
    x = 0
    y = 0
    for tmpl in tmplist:
        (mydir,mymag) = tmpl.split(' ')
        if mydir == "forward":
            x += int(mymag)
        elif mydir == "down":
            y += int(mymag)
        elif mydir == "up":
            y -= int(mymag)
    return(x,y)

if __name__ == '__main__':

    mylist = []
    with open(inputfile) as file:
        mylist = file.readlines()
        mylist = [line.rstrip() for line in mylist]
    (x,y) = dopath(mylist)
    res = int(x) * int(y)
    print(res)
