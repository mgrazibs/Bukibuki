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
        'CREATE TABLE PACOTE (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo varchar(100), url_image varchar(100), descricao varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO PACOTE (id, titulo, url_image, descricao) VALUES (1, 'Literatura Nacional', 'https://biblioo.info/wp-content/uploads/2016/10/livros-brasileiros.png', 'Leia famossos livros da literatura brasileira\n escritos por grandes autores como: \n Machado de Assis;\n Clarice Lispector;\n Jorge Amado');";
    await db.execute(sql);

    sql =
        "INSERT INTO PACOTE (id, titulo, url_image, descricao) VALUES (2, 'Literatura Internacinal','https://www.estadao.com.br/resizer/v2/V3B5VFNLL5AJBMXVVZLF6DV5EU.png?quality=80&auth=398d0ee981dcc406ca271a322ad49ceeaa9b70793cc27fb7d0df6544266e4a16&width=1200', 'Grandes escritores da literatura Internacional:\n Leo Tolstói (Rússia);\n Gabriel García Márquez (Colômbia);\n William Shakespeare (Inglaterra).');";
    await db.execute(sql);
  }
}
