import 'dart:async';

import 'package:path/path.dart';
import 'package:projeto/bd/db_helper.dart';
import 'package:projeto/domain/card_livro.dart';
import 'package:projeto/BD/database.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  listarPacotes() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM PACOTE;';

    var result = await database.rawQuery(sql);

    List<CardLivro> lista = [];
    for (var json in result) {
      CardLivro pacote = CardLivro.fromjson(json);
      lista.add(pacote);
    }
    return lista;
      }
}
