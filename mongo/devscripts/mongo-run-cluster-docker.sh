#export PATH=./build/optdebug/install/bin:$PATH
#!/bin/bash
docker pull mongo 
docker run --name nhtt -d mongo &

sleep 5 

docker exec nhtt mkdir -p /logs 
docker exec -d nhtt mongo --eval "MongoRunner.dataPath = '/data/db/'; MongoRunner.dataDir = '/data/db/'; sleep(2000); new ShardingTest({shards: 2, rs: {nodes: 2}}); while(true){}" --shell --nodb

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
docker cp ${SCRIPT_DIR}/upload-data.sh nhtt:/upload-data.sh

#open interactive shel 
docker exec -it nhtt bash