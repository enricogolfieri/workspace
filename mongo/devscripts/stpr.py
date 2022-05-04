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

calltable = PrettyTable(['c','ctx','id','msg','attr'],align='l')

R = "\033[0;31;40m" #RED
G = "\033[0;32;40m" # GREEN
Y = "\033[0;33;40m" # Yellow
B = "\033[0;34;40m" # Blue
N = "\033[0m" # Reset
color = [R,G,Y,B]

colorindex = 0
while True:
    line = os.sys.stdin.readline()
    if not line:
        break

    try:
        jsonline = json.JSONDecoder().decode(line)
        
        if "Frame" in line:
            continue
        
        attr = "";
        if "attr" in jsonline:
            attr = json.dumps(jsonline["attr"])

        calltable.add_row([color[colorindex] + str(jsonline["c"]) + N, \
                           color[colorindex] + str(jsonline['ctx']) + N, \
                           color[colorindex] + str(jsonline['id'] )+ N, \
                           color[colorindex] + str(jsonline['msg']) + N, \
                           color[colorindex] + fill(attr, width=50) + N])

        colorindex = colorindex + 1
        if colorindex >= len(color): 
            colorindex = 0

    except json.decoder.JSONDecodeError as e:
        #if not json just print it 
        print(line,file=sys.stdout)

print(calltable, file = sys.stdout)
