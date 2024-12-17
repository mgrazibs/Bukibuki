import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  State<cadastro> createState() => _cadastroState();
}


class _cadastroState extends State<cadastro> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Cadastrar usuario',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF10397B),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: (value) {
                      if (value!.contains("@")) {
                        return null;
                      } else {
                        return "Digite um e-mail válido!";
                      }
                    },
                    decoration: buildInputDecoration('E-mail'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    controller: senhaController,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length >= 6) {
                        return null;
                      } else {
                        return "Digite uma senha válida!";
                      }
                    },
                    decoration: buildInputDecoration('Senha'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      String senha = senhaController.text;
                      if (value!.length >= 6) {
                        return null;
                      } else if (senha != value) {
                        return "As senhas precisam ser iguais!";
                      } else {
                        return "Digite uma senha válida!";
                      }
                    },
                    decoration: buildInputDecoration('Confirmar Senha'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 32),
                  // Spacer(),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE81F7C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Cadastrar',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
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
      floatingLabelStyle: GoogleFonts.montserrat(
          color: const Color(0xFF10397B), fontWeight: FontWeight.w600),
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
}