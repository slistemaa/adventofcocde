#!/usr/bin/python

inputfile = "day2input.txt"

def dopath(tmplist):   
    x = 0
    y = 0
    z = 0
    for tmpl in tmplist:
        (mydir,mymag) = tmpl.split(' ')
        if mydir == "forward":
            x += int(mymag)
            y += int(mymag)*z
        elif mydir == "down":
            z += int(mymag)
        elif mydir == "up":
            z -= int(mymag)
    return(x,y)

if __name__ == '__main__':

    mylist = []
    with open(inputfile) as file:
        mylist = file.readlines()
        mylist = [line.rstrip() for line in mylist]
    (x,y) = dopath(mylist)
    print(x,y)
    res = int(x) * int(y)
    print(res)
