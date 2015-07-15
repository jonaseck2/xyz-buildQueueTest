docker exec -it vagrant_builder_1 bash
mkdir -p /testsad && cd /testsad && echo '
{
  "name": "buildQueuTest",
  "version": "0.0.0",
  "description": "Adds a build queue job",
  "main": "buildQueueTest.js",
  "scripts": {
    "test": "node src"
  },
  "dependencies": {
    "mongodb": "^1.4.33"
  }
}
' > package.json && echo '
var mongodb = require("mongodb");
var MongoClient = mongodb.MongoClient;
var dbHost = "mongodb";
var dbName = "inhouse";

MongoClient.connect("mongodb://" + dbHost + "/" + dbName, function (err, db) {
  if (err) {
    throw err;
  }
  var buildqueue = db.collection("buildqueue");

  var build = {
    fullName: "jonaseck2/xyz-docker-nodejs",
    name: "xyz-docker-nodejs",
    repo: "https://github.com/jonaseck2/xyz-docker-nodejs.git",
    commit: "4a86f08f9905bf6b82c685a9cd88bdf1d1d15547",
    endpoint: "hello-world-node",
    createdAt: new Date(),
    buildAt: null,
    nrOfAttempts: 0,
    isSuccessful: false,
    message: null,
    pusher: {"name":"jonaseck2","email":"jonaseck@gmail.com"}
  };
  buildqueue.insert(build, function (err) {
    if (err) {
      console.log("buildqueue insert failed");
    }
    console.log("buildqueue insert successful");
  });
});
' > buildQueueTest.js && npm install . && node .
