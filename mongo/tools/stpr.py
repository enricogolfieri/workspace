# If you need to set up the repro environment:
# Please see this README file for the db-contrib-tool installation guide and this README file for setting up the repro environment (including resmoke) on spawn hosts or virtual workstations.

# Creating the script:
#cat << EOF > filter_backtrace_mongod.py
#!/opt/mongodbtoolchain/v3/bin/python3

from __future__ import print_function

import json
from logging import exception
import os
import sys
from prettytable import PrettyTable
from textwrap import fill


R = "\033[0;31;40m" #RED
G = "\033[0;32;40m" # GREEN
Y = "\033[0;33;40m" # Yellow
B = "\033[0;34;40m" # Blue
N = "\033[0m" # Reset
color = [R,G,Y,B]


class Table :
    def __init__(self,header,**args):
        self.table = PrettyTable(header,**args)
        self.colorindex = 0 

    def add_row(self,cells):
        print(cells)
        for i,c in enumerate(cells):
            cells[i] = color[self.colorindex] + str(c) + N 
        
        self.table.add_row( cells )

        self.colorindex = self.colorindex + 1
        if self.colorindex >= len(color): 
            self.colorindex = 0 

    def print(self):
        print(self.table, file = sys.stdout)


class Printer:  
    def __init__(self):
        self.colorindex = 0

    def print(self,line):

        print(color[self.colorindex] + str(line) + N ,file=sys.stdout)

        self.colorindex = self.colorindex + 1
        if self.colorindex >= len(color): 
            self.colorindex = 0 

calltable = Table(['c','ctx','id','msg','attr'],align='l')

printer = Printer()

while True:
    line = os.sys.stdin.readline()
    if not line:
        break

    try:
        jsonline = json.JSONDecoder().decode(line)
        
        if "Frame" in line:
            if "C" in jsonline["attr"]["frame"]:
                printer.print(jsonline["attr"]["frame"]["C"])
            continue
        
        attr = "";
        if "attr" in jsonline:
            attr = json.dumps(jsonline["attr"])

        calltable.add_row([jsonline["c"], \
                          jsonline['ctx'] , \
                          jsonline['id'] , \
                          jsonline['msg'] , \
                        fill(attr, width=80) ])

    except json.decoder.JSONDecodeError as e:
        #if not json just print it 
        print(line,file=sys.stdout)

calltable.print()