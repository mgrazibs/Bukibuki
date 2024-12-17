class daoodao {

  late String nome;
  late String email;
  late String senha;

  daoodao({
    required this.nome,
    required this.email,
    required this.senha,
  });

  daoodao.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha= json['senha'];
      }
}