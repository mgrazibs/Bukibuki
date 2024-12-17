class Produto {
  late String id;
  late String urlimagem;
  late String autores;
  late String titulo;
  late String subtitulo;
  late String valor;
  //os valores a seguir serão passados como parâmentros pois serão usados em outras classes
  Produto(this.id, this.urlimagem, this.autores, this.titulo, this.subtitulo,
      this.valor);

  //essa linha de código será responsável por definir os atributos como objetos, dando um valor a eles
  //Basicamente, um mapa será criado com esses atributos e objetos
  //os objetos serão strings com valores dinâmicos
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    //são passados os atributos para adicionar os objetos na tabela
    json['id'] = id;
    json['urlimagem'] = urlimagem;
    json['autores'] = autores;
    json['titulo'] = titulo;
    json['subtitulo'] = subtitulo;
    json['valor'] = valor;

    //O json, definido durante a classe, será retornado
    return json;
    //O que eu entendi: o json forma mapas(linhas) com atributos e objetos
    //dentro de uma tabela de informações que poderá vir a ser consgultada futuramente para
    //a confirmação de registro de dados
      }
}