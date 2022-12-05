(function(){


    var ut = function(){
        return "try ut.help();";    
    };

    ut.createDemoShardedCollection = function(nChunks){
        db.adminCommand({enableSharding:"demodb"})
        db.adminCommand({shardCollection: "demodb.sharded_coll", key: {_id: 'hashed'}, numInitialChunks: nChunks})
    };


    ut.removeShard = function(shardid){
        db.adminCommand({removeShard:shardid})
    };

    ut.addShard = function(shardid){
        db.adminCommand({addShard:shardid})
    };
    

    db.getSiblingDB("config").system.js.save({
        _id: "ut",
        value: ut
    });
    
})();
