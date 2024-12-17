import 'package:myapp/bd/db_helper.dart';
import 'package:myapp/Domain/domain.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  salvarPacote(CompraLivro compralivro) async {
    Database database = await DBHelper().initDB();
    database.insert('PACOTE', compralivro.toJson());
  }

  listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM PACOTE;';
    var result = await database.rawQuery(sql);

    List<CompraLivro> lista = [];
    for (var json in result) {
      CompraLivro pacote = CompraLivro.fromJson(json);
      lista.add(pacote);
    }

    return lista;
  }
}
