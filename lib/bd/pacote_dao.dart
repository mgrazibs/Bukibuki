import 'package:myapp/Domain/pacote_literatura.dart';
import 'package:myapp/bd/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  salvarPacote(PacoteLiteratura pacote) async {
    Database database = await DBHelper().initDB();
    database.insert('PACOTE', pacote.toJson());
  }

  listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM PACOTE;';
    var result = await database.rawQuery(sql);

    List<PacoteLiteratura> lista = [];
    for (var json in result) {
      PacoteLiteratura pacote = PacoteLiteratura.fromJson(json);
      lista.add(pacote);
    }

    return lista;
  }
}
