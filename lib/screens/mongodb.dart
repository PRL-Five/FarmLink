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
  static insert(dict items) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME);
    collection.insertOne(items);
    print(await collection.find().toList());
  }
}