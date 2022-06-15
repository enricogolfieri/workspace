#!/bin/bash

#killing process
pkill -9 mongod -f
pkill -9 mongos 

nodes=2
shards=3
database="foo"
minport=20000
export PATH=./build/debug/install/bin:$PATH

echo "clearning /data/db"
rm -rf /data/db/*

echo "running cluster with $shards shards with $nodes nodes"
mongo --eval "MongoRunner.dataPath = '/data/db/';  MongoRunner.dataDir = '/data/db/'; sleep(1000); TestData = {minPort: $minport};  var st = new ShardingTest({shards:$shards, nodes:$nodes});  while(true){}" --shell --nodb > /home/ubuntu/local.log 2>&1 &

echo "creating cluster ... wait 20s before attempting connection"
sleep 15
echo "5s left"
sleep 2 
echo "3s left"
sleep 3

PORT_ms=$(($minport + $shards * $nodes));

echo "build/debug/install/bin/mongo --port $PORT_ms"
mongo --port $PORT_ms 
#"/home/ubuntu/.config/workspace/mongo/queries/sales/init.mongodb"