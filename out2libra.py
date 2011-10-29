#!/usr/bin/python
import sys
import csv

mbdy = csv.reader(sys.stdin)

for row in mbdy:
    print row[1] + "-" + row[2] + "-" + row[3] + ";" + str(float(row[10])/10)
