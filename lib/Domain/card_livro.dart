class CardLivro {
  //pacote
  late int id;
  late String urlImagem;
  late String autores;
  late String titulo;
  late String subtitulo;
  late String valor;
  late int estrelas;

  CardLivro({
    required this.urlImagem,
    required this.autores,
    required this.titulo,
    required this.subtitulo,
    required this.valor,
    required this.estrelas,
  });
  CardLivro.fromjson(Map<String, dynamic> json) {
    // .json é um arquivo que contém uma série de dados estruturados
    // em formato texto e é utilizado para transferir informações
    // entre sistemas
    id = json['id'];
    urlImagem = json['url_image'];
    titulo = json['titulo'];
    subtitulo = json['subtitulo'];
    autores = json['autores'];
    valor = json['valor'];
    estrelas = json['estrelas'];
      }
}