import 'package:myapp/Domain/domain.dart';

class Database {
  static List pacotes = [
    CompraLivro(
      urlImage:
          'https://m.media-amazon.com/images/I/81PQNhm2shL._AC_UF1000,1000_QL80_.jpg',
      titulo: 'MYSTICAL',
      cont: 1,
      valor: 220.90,
    ),
    CompraLivro(
      urlImage:
          'https://m.media-amazon.com/images/I/91N9kjbqxWS._AC_UF1000,1000_QL80_.jpg',
      titulo: 'O REI PERVERSO',
      cont: 1,
      valor: 30,
    ),
    CompraLivro(
      urlImage:
          'https://m.media-amazon.com/images/I/815Xccj7IRL._AC_UF1000,1000_QL80_.jpg',
      titulo: 'O REINO SECRETO',
      cont: 1,
      valor: 10,
    ),
  ];
}
