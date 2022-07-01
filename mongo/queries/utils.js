(function(){
    var ut = function(){

        var createDemoShardedCollection = function(nChunks)
        {
            db.adminCommand({enableSharding:"demodb"})
            db.adminCommand({shardCollection: "demodb.sharded_coll", key: {_id: 'hashed'}, numInitialChunks: nChunks})
        };

        var removeShard = function(shardid)
        {
            db.adminCommand({removeShard:shardid})
        };

        var addShard= function(shardid)
        {
            db.adminCommand({addShard:shardid})
        };
    };

    db.getSiblingDB("system.js").save({
        _id: "ut",
        value: ut
    });
    
})();
