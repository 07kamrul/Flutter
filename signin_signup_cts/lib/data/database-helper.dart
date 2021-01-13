import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:signin_signup_cts/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;
  final String tableUser = "User";
  final String columnName = "name";
  // final String columnEmail = "email";
  // final String columnDesignation = "designation";
  final String columnUserName = "username";
  final String columnPassword = "password";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    // var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {

    await db.execute(
        "CREATE TABLE User(id, INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT, flaglogged TEXT)");
    print("Table is created");
  }


  // void _onUpgrade(Database db, int oldVersion, int newVersion) {
  //   if (oldVersion < newVersion) {
  //     db.execute("ALTER TABLE User ADD COLUMN email TEXT, designation TEXT;");
  //   }
  // }


  //Insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    print(user.name);
    print(user.username);
    print(user.password);


    int res = await dbClient.insert("User", user.toMap());
    List <Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  //Deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<User> seleteUser(User user) async {
    print("Select User");
    print(user.username);
    print(user.password);

    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnName, columnUserName,columnPassword],
        where : "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [user.username, user.password]);
    print(maps);
    
    if (maps.length > 0) {
      print("User Exist !!! ");

      user.name = maps[0]['name'];
      user.username = maps[0]['username'];

      print(user);

      return user;
    }else {
      return null;
    }
  }

  Future<int> update(User user) async {
    var dbClient = await db;

    return await dbClient.update(tableUser, user.toMap(),
        where: '$columnUserName = ?', whereArgs: [user.username]);
  }

}