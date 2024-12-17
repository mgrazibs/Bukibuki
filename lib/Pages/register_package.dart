import 'package:myapp/bd/pacote_dao.dart';
import 'package:myapp/Domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPackage extends StatefulWidget {
  const RegisterPackage({super.key});

  @override
  State<RegisterPackage> createState() => _RegisterPackageState();
}

class _RegisterPackageState extends State<RegisterPackage> {
  TextEditingController idController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController contController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFC4FFCE),
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildTextFormField(
            controller: idController,
            text: 'ID do Livro',
          ),
          buildTextFormField(
            controller: urlImageController,
            text: 'Url da Imagem do Livro',
          ),
          buildTextFormField(
            controller: tituloController,
            text: 'Título do Livro',
          ),
          buildTextFormField(
            controller: contController,
            text: 'Quantidade de Livro(s)',
          ),
          buildTextFormField(
            controller: valorController,
            text: 'Valor do Livro',
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F68F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Cadastrar Livro',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildTextFormField({
    required TextEditingController controller,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: fieldValidator,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0xFF10397B),
      ),
    );
  }

  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    } else {
      return null;
    }
  }

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFF10397B),
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: const Text(
        'Novo Livro Adicionado',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFF10397B),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF10397B),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    int id = int.parse(idController.text);
    String urlImage = urlImageController.text;
    String titulo = tituloController.text;
    int cont = int.parse(contController.text);
    double valor = double.parse(valorController.text);

    CompraLivro compralivro = CompraLivro(
      id: 0,
      urlImage: urlImage,
      titulo: titulo,
      cont: cont,
      valor: valor,
    );

    await PacoteDao().salvarPacote(compralivro);
    Navigator.pop(context);
  }
}