var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  var dbo = db.db("mydb");
  //insert Into Collection
  var myobj = [{ name: "Company Inc", address: "Highway 37" },
                {name: "Thu", address: "Ha noi" },
                {name: "Nga", address: "Hai Duong"}];
  dbo.collection("customers").insertMany(myobj, function(err, res) {
    if (err) throw err;
    console.log("Number of documents inserted: " + res.insertedCount);
    db.close();
  });
});
