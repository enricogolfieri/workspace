#!/bin/bash
export PATH=./build/debug/install/bin:$PATH

#// Insert 10MB in order to create big chunk (chunkSize is set to 1MB)
mongos --eval ' \
        const bigString = "X".repeat(1024 * 1024 / 4);  \
        const coll = mongos.getCollection(ns); \
        let bulk = coll.initializeUnorderedBulkOp(); \
        for (var i = 0; i < 10; i++) { \
            bulk.insert({a: i, b: i, str: bigString}); \
        } \
        assert.commandWorked(bulk.execute());'