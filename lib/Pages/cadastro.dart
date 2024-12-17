import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:projeto/BD/Produto_dao.dart';
import 'package:projeto/bd/database.dart';
import 'package:projeto/domain/Produto.dart';
import 'package:projeto/domain/card_livro.dart';
import 'package:projeto/widgets/detail_livros.dart';
import 'package:projeto/Domain/User.dart';
import 'package:projeto/BD/pacote_dao.dart';

class UserDao {
  Future<void> saveProduto(Produto produto) async {
    // Lógica para salvar o usuário, como em um banco de dados
  }
}

class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  State<cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<cadastro> {
  TextEditingController urlimagemController = TextEditingController();
  TextEditingController TituloController = TextEditingController();
  TextEditingController subtituloControler = TextEditingController();
  TextEditingController AutoresControler = TextEditingController();
  TextEditingController ValorControler = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          //padding: espaço das bordas, ao redor do local de nome, idade e da informação em texto acima
            padding: const EdgeInsets.all(16),
            //o form agrupa elementos de entrada(de cadastro)
            //o child abre portas para que outros widgets sejam utilizados junto ao form
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Children de apresentação:
                  Text(
                    'Cadastro de livros',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //espaço entre a mensagem de cadastro e o espaço do nome
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: urlimagemController,
                    validator: (value) {
                      if (value!.length >= 10) {
                        return null;
                      } else {
                        return "Você precisa digitar um link válido!";
                      }
                    },
                    decoration: buildInputDecoration('Imagem(link)'),
                    cursorColor: const Color(0xFFB1D4E0),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: TituloController,
                    validator: (value) {
                      if (value!.length >= 10) {
                        return null;
                      } else {
                        return "Você precisa digitar um Título válido!";
                      }
                    },
                    decoration: buildInputDecoration('Título'),
                    cursorColor: const Color(0xFFB1D4E0),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: subtituloControler,
                    validator: (value) {
                      if (value!.length >= 1) {
                        return null;
                      } else {
                        return "Você precisa inserir um subtitulo válido!";
                      }
                    },
                    decoration: buildInputDecoration('subtitulo'),
                    cursorColor: const Color(0xFFb1d4e0),
                  ),

                  const SizedBox(height: 16),
                  TextFormField(
                    controller: AutoresControler,
                    validator: (value) {
                      if (value!.length >= 1) {
                        return null;
                      } else {
                        return "Você precisa inserir um autor válido!";
                      }
                    },
                    decoration: buildInputDecoration('Autores'),
                    cursorColor: const Color(0xFFb1d4e0),
                  ),

                  const SizedBox(height: 16),
                  TextFormField(
                    controller: ValorControler,
                    validator: (value) {
                      if (value!.length >= 1) {
                        return null;
                      } else {
                        return "Você precisa inserir um valor válido!";
                      }
                    },
                    decoration: buildInputDecoration('Valor'),
                    cursorColor: const Color(0xFFb1d4e0),
                  ),

                  //botão de cadastro
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9BC28B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Cadastrar',
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF020202),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    // Validar o Form
    if (formKey.currentState!.validate()) {
      // Verifica os valores cadastrados
      String imagem = urlimagemController.text;
      String titulo = TituloController.text;
      String subtitulo = subtituloControler.text;
      String autores = AutoresControler.text;
      String valor = ValorControler.text;

      Produto produto = Produto(imagem, titulo, subtitulo, autores, valor);
      await UserDao().saveProduto(produto);
      Navigator.pop(context as BuildContext);
    }
  }
}