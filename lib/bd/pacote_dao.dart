import 'package:bukibuki/bancodedados/db_helper.dart';
import 'package:bukibuki/domain/daoo_dao.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM PACOTE;';
    var result = await database.rawQuery(sql);

    List<daoodao> lista = [];
    for (var json in result) {
      daoodao pacote = daoodao.fromJson(json);
      lista.add(pacote);
    }

    return lista;
      }
}