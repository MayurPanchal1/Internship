const express = require("express");
const mongodb = require("mongodb");
const admin = require("firebase-admin");
const serviceAccount = require("./internship-6f3c6-firebase-adminsdk-68gbe-a5bb5ced2f.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const MongoClient = mongodb.MongoClient;

let database;

async function initDb() {
  const client = await MongoClient.connect("mongodb://127.0.0.1:27017");
  database = client.db("project");
}

function getDb() {
  if (!database) {
    throw new Error("Database not connected");
  }
  return database;
}

const app = express();
app.use(express.json());

app.post("/data", function (req, res, next) {
  console.log(req.body);
  getDb().collection("userData").insertOne(req.body);
  console.log("Data submited");
  res.json("Data submited");
});

app.post("/message", function (req, res, next) {
  const message = {
    notification: {
      title: "New Notification",
      body: "This is a test notification",
    },
    data: {
      customKey: "customValue",
    },
    token: "eCSlqfrXTqWI9RopBda4-w:APA91bGtO00Kk9RZbRnqgthZ1pbZU-8rS0QiNa7WTUJfQlRW3RSDB4OFnY5BdDEA-MUWPc7mImwuCvy6S80-5nk-TQi4RQPRTDparjtCkShDMxDrTaI_1Q7rhdv3uomF3DdzfHVKX_u1",
  };

  admin
    .messaging()
    .send(message)
    .then((response) => {
      res.send('Success');
      console.log("Successfully sent message:", response);
    })
    .catch((error) => {
      res.send('Error');
      console.log("Error sending message:", error);
    });
});

initDb()
  .then(function () {
    app.listen(3000, console.log("Listining to port 3000"));
  })
  .catch(function (error) {
    console.log("Connecting to the database failed");
  });
