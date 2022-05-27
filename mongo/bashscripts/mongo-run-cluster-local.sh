#!/bin/bash

#killing process
pkill -9 mongod -f
pkill -9 mongos 


export PATH=./build/debug/install/bin:$PATH
mongo --eval "MongoRunner.dataPath = '/data/db/';  MongoRunner.dataDir = '/data/db/'; sleep(1000); TestData = {minPort: 20000};  var st = new ShardingTest({shards:2}); st.s.adminCommand({shardCollection: 'mydb.test', key: {_id: 1}}); st.s.adminCommand({split: 'mydb.test', middle: {_id: 0}}); st.s.adminCommand({moveChunk: 'mydb.test', find: {_id: 0}, to: st.shard0.shardName}); st.s.adminCommand({shardCollection: 'foo.test', key: {_id: 'hashed'}, numInitialChunks: 8000}); while(true){}" --shell --nodb > /home/ubuntu/local.log 2>&1 &

echo "creating cluster ... wait 20s before attempting connection"
sleep 5
echo "15s left"
sleep 5
echo "10s left"
sleep 5
echo "5s left"
sleep 2 
echo "3s left"
sleep 3

mongo --port 20005 #this should change according to your configuration (todo calculate this value according to input nodes and shards number)