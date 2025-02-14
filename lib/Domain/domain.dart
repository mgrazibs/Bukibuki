class CompraLivro {
  late int id;
  late String urlImage;
  late String titulo;
  late int cont;
  late double valor;
  late String cidade;


  CompraLivro({
    required this.urlImage,
    required this.titulo,
    required this.cont,
    required this.valor,
    required this.id,
    required this.cidade
  });


  CompraLivro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['urlImage'];
    titulo = json['titulo'];
    cont = json['cont'];
    valor= json['valor'];
    cidade = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['id'] = id;
    json['titulo'] = titulo;
    json['urlmage'] = urlImage;
    json['cont'] = cont;
    json['valor'] = valor;
    json['cidade'] = cidade;

    return json;
  }
}
