
(function() { 

    db.bigstring.drop();

    print("creating collection")

    db.createCollection('bigstring')

    sh.enableSharding('test')
    print("enabled sharding")
    db.adminCommand({shardCollection: 'test.bigstring', key: {_id: 'hashed'}, numInitialChunks: 20})


    print("computing big string")

    var bigString = "X".repeat(256 * 1024);  // 250 KB

    print("big string ready")

    var insertedBytes = 0;
    var num = 0;

    // Insert 20 MB of data to result in 20 chunks
    var bulk = db.bigstring.initializeUnorderedBulkOp();
    while (insertedBytes < (20 * 1024 * 1024)) {
        bulk.insert({_id: num++, s: bigString, x: Math.random()});
        insertedBytes += bigString.length;
    }

    bulk.execute({w: 3});

    print("big string inserted")
})();