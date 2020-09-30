import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "demo.db";
  static final _tableName = "test";
  static final _version = 1;

  static final columnID = "id";
  static final columnName = "name";
  static final columnAge = "age";
  static Database _database;

  DatabaseHelper._privateContructor();
  static final DatabaseHelper instance = DatabaseHelper._privateContructor();

  // *getter for database

  Future<Database> get database async {
    if (_database != null) {
      debugPrint("returning from database getter 1:");
      debugPrint(_database.toString());
      return _database;
    }
    _database = await _initDatabase();
    debugPrint("returning from database getter 2:");
    debugPrint(_database.toString());
    return _database;
  }

  //* create Database
  _initDatabase() async {
    var _databasePath =
        await getDatabasesPath(); //* get path to current app folder
    String _path = join(_databasePath, _databaseName);

    _database = await openDatabase(_path, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
      )
      ''');
    });
    return _database;
    /*Database and table are created*/
  }

  //* insert into database
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  //* Get all rows from database
  Future<List<Map<String, dynamic>>> findall() async {
    Database db = await instance.database;
    return db.query(_tableName);
  }

  //* find with specific query
  Future<List<Map<String, dynamic>>> querySpecific(int age) async {
    Database db = await instance.database;

    var resultrows = db.query(
      _tableName,
      where: "age > ?",
      whereArgs: [age],
    );
    return resultrows;
  }

  //* Update query

  Future<int> updateQuery(int id) async {
    Database db = await instance.database;
    var row = db.update(_tableName, {"name": "Amir", "age": 26},
        where: " id = ?", whereArgs: [id]);
    return row;
  }

  //* delete rows with age given
  Future<int> deleteQuery(int age) async {
    Database db = await instance.database;
    var result = db.delete(_tableName, where: "age = ?", whereArgs: [age]);
    return result;
  }
}
