#!/bin/bash

mkdir /datatmp
mongoexport --uri="mongodb+srv://egol:student@cluster0.ssmy4.mongodb.net/sample_training?retryWrites=true&w=majority"  --collection=trips  --out=/datatmp/trips.json
mongoexport --uri="mongodb+srv://egol:student@cluster0.ssmy4.mongodb.net/sample_training?retryWrites=true&w=majority"  --collection=zips   --out=/datatmp/zips.json

mongoimport --host "localhost:20007" -d "sample_training" -c "trips" --file "datatmp/trips.json"
mongoimport --host "localhost:20007" -d "sample_training" -c "zips"  --file "datatmp/zips.json"

#cleaning
rm -rf datatmp