var mongodb = require("mongodb");
var MongoClient = mongodb.MongoClient;
var dbHost = "mongodb";
var dbName = "inhouse";

MongoClient.connect("mongodb://" + dbHost + "/" + dbName, function (err, db) {
  if (err) {
    throw err;
  }
  var buildqueue = db.collection("buildqueue");

  var builds = [];

  addbuild('https://github.com/jonaseck2/xyz-docker-nodejs.git', builds);

  buildqueue.insert(build, function (err) {
    if (err) {
      console.log("buildqueue insert failed");
    }
    console.log("buildqueue insert successful");
  });
});

function addBuild(repo, builds) {
  var build = {
    //repo: "https://github.com/jonaseck2/xyz-docker-nodejs.git",
    var fullName = repo.match('[^\/]*\/[^\/]*$')  // jonaseck2/xyz-docker-nodejs.git
    var name = fullName.match('^[^.]*') // xyz-docker-nodejs
    fullName: fullName,
    name: name,
    repo: repo,
    commit: "master",
    endpoint: name,
    createdAt: new Date(),
    buildAt: null,
    nrOfAttempts: 0,
    isSuccessful: false,
    message: null,
    pusher: {"name":"username","email":"email"}
  };

  builds.splice(builds.length, 0, build)
}
