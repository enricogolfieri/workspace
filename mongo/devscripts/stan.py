# If you need to set up the repro environment:
# Please see this README file for the db-contrib-tool installation guide and this README file for setting up the repro environment (including resmoke) on spawn hosts or virtual workstations.

# Creating the script:
#cat << EOF > filter_backtrace_mongod.py
#!/opt/mongodbtoolchain/v3/bin/python3

from __future__ import print_function

import json
import os
import signal
import sys

sys.path.append(os.environ['PWD'])
import buildscripts.mongosymb as mongosymb

beginBacktrace = '----- BEGIN BACKTRACE -----'
endBacktrace = '-----  END BACKTRACE  -----'

class State(object):
    NORMAL = 0
    JSON_BACKTRACE = 1
    FRAMES_BACKTRACE = 2

# Ignore Ctrl-C. When the process feeding the pipe exits,  will be closed.
signal.signal(signal.SIGINT, signal.SIG_IGN)

state = State.NORMAL
framesBacktrace = []
while True:
    line = os.sys.stdin.readline()
    if not line:
        break

    line = line.rstrip()
    if state == State.NORMAL:
        if 'Frame: 0x' in line:
            continue

        if '{"backtrace":' in line:
            prefix = line[:line.index('{"backtrace":')]
            backtrace = line[line.index('{"backtrace":'):]
            traceDoc = json.JSONDecoder().raw_decode(backtrace)[0]
            frames = mongosymb.symbolize_frames(traceDoc, mongosymb.PathDbgFileResolver('./mongod'), '/opt/mongodbtoolchain/v4/bin/llvm-symbolizer', [], 'classic')
            print(prefix)
            mongosymb.classic_output(frames, os.sys.stdout, indent=2)
        elif line.endswith(beginBacktrace):
            print(line)
            state = State.JSON_BACKTRACE
        else:
            print(line)
    elif state == State.JSON_BACKTRACE:
        try:
            line = line[line.index('{"backtrace":'):]
        except ValueError:
            if "Top-level" in line:
                print(line)
                continue
            else:
                print("Bad line: " + line.strip())
                os.exit(1)

        traceDoc = json.JSONDecoder().raw_decode(line)[0]
        frames = mongosymb.symbolize_frames(traceDoc, mongosymb.PathDbgFileResolver('./mongod'), '/opt/mongodbtoolchain/v4/bin/llvm-symbolizer', [], 'classic')
        mongosymb.classic_output(frames, os.sys.stdout, indent=2)
        state = State.FRAMES_BACKTRACE
    elif state == State.FRAMES_BACKTRACE:
        if line.endswith(endBacktrace):
            print(line)
            state = State.NORMAL
    else:
        print("BUGF")