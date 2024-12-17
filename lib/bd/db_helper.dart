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
        'CREATE TABLE PACOTE (id INTEGER PRIMARY KEY AUTOINCREMENT, urlImage varchar(100), titulo varchar(100), cont varchar(100), valor varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO PACOTE (id, urlImage, titulo, cont, valor) VALUES (1, 'https://m.media-amazon.com/images/I/81PQNhm2shL._AC_UF1000,1000_QL80_.jpg', 'MYSTICAL', 1, 220.90);";
    await db.execute(sql);

    sql =
    "INSERT INTO PACOTE (id, urlImage, titulo, cont, valor) VALUES (2, 'https://m.media-amazon.com/images/I/91N9kjbqxWS._AC_UF1000,1000_QL80_.jpg', 'O REI PERVERSO', 1, 30);";
    await db.execute(sql);

    sql =
    "INSERT INTO PACOTE (id, urlImage, titulo, cont, valor) VALUES (3, 'https://m.media-amazon.com/images/I/815Xccj7IRL._AC_UF1000,1000_QL80_.jpg', 'O REINO SECRETO', 1, 10);";
    await db.execute(sql);
  }
}
