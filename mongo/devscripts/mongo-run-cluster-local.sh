#!/bin/bash

#killing process
pkill -9 mongod -f
pkill -9 mongos 
pkill -9 mongo 

export PATH=./build/debug/install/bin:$PATH
mongo --eval "MongoRunner.dataPath = '/data/db/'; MongoRunner.dataDir = '/data/db/'; sleep(2000); new ShardingTest({shards: 2, rs: {nodes: 2}}); while(true){}" --shell --nodb > /home/ubuntu/local.log 2>&1 