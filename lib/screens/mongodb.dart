import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constant.dart';
typedef dict = Map<String, dynamic>;
class mongodb {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
  }
  static insertFarmer(dict items) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_FARMER);
    collection.insertOne(items);
    print(await collection.find().toList());
  }
  static insertUser(dict items) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    collection.insertOne(items);
  }
  static Future<bool> emailExistsUser(String email) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    print(await collection.findOne({"email" : email}));
    if(await collection.findOne({"email" : email}) == null) {
      print("Email not found");
      return false;
    }
    print("Email Found");
    return true;
  }
  static Future<bool> emailExistsFarmer(String email) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_FARMER);
    print(await collection.findOne({"email" : email}));
    if(await collection.findOne({"email" : email}) == null) {
      print("Email not found");
      return false;
    }
    print("Email Found");
    return true;
  }
  static Future<bool> passwordExistsUser(String password) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    if(await collection.findOne({"password" : password}) == null) {
      print("Email not found");
      return false;
    }
    print("Email Found");
    return true;
  }
}