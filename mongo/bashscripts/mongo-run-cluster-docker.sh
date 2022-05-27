#export PATH=./build/optdebug/install/bin:$PATH
#!/bin/bash
docker pull mongo 
docker run --name nhtt -d mongo &

sleep 5 

docker exec nhtt mkdir -p /logs 
docker exec -d nhtt mongo --eval "MongoRunner.dataPath = '/data/db/';  MongoRunner.dataDir = '/data/db/'; sleep(1000); TestData = {minPort: 20000};  var st = new ShardingTest({shards:2}); st.s.adminCommand({shardCollection: 'mydb.test', key: {_id: 1}}); st.s.adminCommand({split: 'mydb.test', middle: {_id: 0}}); st.s.adminCommand({moveChunk: 'mydb.test', find: {_id: 0}, to: st.shard0.shardName}); st.s.adminCommand({shardCollection: 'foo.test', key: {_id: 'hashed'}, numInitialChunks: 8000}); while(true){}"  --shell --nodb


#open interactive shel 
docker exec -it nhtt bash