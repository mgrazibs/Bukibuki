import 'package:myapp/Domain/pacote_literatura.dart';
import 'package:flutter/material.dart';
import 'package:myapp/bd/pacote_dao.dart';

class RegisterPackage extends StatefulWidget {
  const RegisterPackage({super.key});

  @override
  State<RegisterPackage> createState() => _RegisterPackageState();
}

class _RegisterPackageState extends State<RegisterPackage> {
  TextEditingController urlImageController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            controller: urlImageController,
            text: 'Url da Imagem',
          ),
          buildTextFormField(
            controller: tituloController,
            text: 'Titulo',
          ),
          buildTextFormField(
            controller: descricaoController,
            text: 'Descrição',
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
              'Cadastrar Pacote',
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
        color: Colors.white,
      ),
      title: const Text(
        'Novo Pacote de Literatura',
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
      labelStyle: const TextStyle(
        color: Color(0xFF10397B),
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
    String urlImage = urlImageController.text;
    String titulo = tituloController.text;
    String descricao = descricaoController.text;

    PacoteLiteratura pacote = PacoteLiteratura(
      urlImage: urlImage,
      titulo: titulo,
      descricao: descricao,
    );

    await PacoteDao().salvarPacote(pacote);
    Navigator.pop(context);
  }
}
