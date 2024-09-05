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
      print("Password not found");
      return false;
    }
    print("Password Found");
    return true;
  }
  static Future<bool> passwordExistsFarmer(String password) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_FARMER);
    if(await collection.findOne({"password" : password}) == null) {
      print("Password not found");
      return false;
    }
    print("Password Found");
    return true;
  }
  static Future<dict?> getDataUser(String email) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    if(await collection.findOne(COLLECTION_NAME_USER) != null) {
       dict ans = await collection.findOne(COLLECTION_NAME_USER) as dict;
       print(ans);
       return ans;
    }
    return null;
  }
  static Future<String> getFullName(String email) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    dict? det = await collection.findOne({"email" : email});
   String ans = det?['fullName'];
    return ans;
  }
  static Future<String> getPassword(String pass) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    dict? det = await collection.findOne({"email" : pass});
    String ans = det?['password'];
    return ans;
  }
  static Future<String> getPhone(String email) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME_USER);
    dict? det = await collection.findOne({"email" : email});
    String ans = det?['mobile'];
    return ans;
  }

}