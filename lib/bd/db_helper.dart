import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    String sql =

    sql = "CREATE TABLE USER (username varchar(100) PRIMARY KEY, password varchar(100))";
    await db.execute(sql);

    sql = "INSERT INTO USER (username, password) VALUES (duda@gmail.com', '123456')";
    await db.execute(sql);
      }
}