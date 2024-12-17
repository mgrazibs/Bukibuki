import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bukibuki/Pages/Projeto.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}


class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Entrar no BUKI BUKI',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfair(
                      color: const Color(0xFF36885E),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    'https://img1.wsimg.com/isteam/ip/230f38fa-d058-440d-b9c8-67b3429c2476/blob-f27724a.png/:/cr=t:21.88%25,l:0%25,w:100%25,h:56.25%25/rs=w:365,h:365,cg:true',
                    height: 180,
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: (value) {
                      if (value!.contains("@")) {
                        return null;
                      } else {
                        return "Você precisa digitar um e-mail válido!";
                      }
                    },
                    decoration: buildInputDecoration('E-mail'),
                    cursorColor: const Color(0xFF080809),
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
                        return "Você precisa digitar uma senha válida!";
                      }
                    },
                    decoration: buildInputDecoration('Senha'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 32),
                  // Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Validar o Form
                      if (formKey.currentState!.validate()) {
                        // Verificar e-mail e senha
                        String email = emailController.text;
                        String senha = senhaController.text;

                        if (email == 'duda@gmail.com' && senha == '123456') {
                          // Navegar p/ HomePage
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Projeto();
                              },
                            ),
                          );
                        } else {
                          print('Usuário e/ou Senha incorreto(s)!');
                        }
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF646060),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Entrar com a conta BUKI BUKI',
                        style: GoogleFonts.merriweather(
                          fontSize: 19,
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
      floatingLabelStyle: GoogleFonts.playfair(
          color: const Color(0xFF050505), fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 3,
          color: Color(0xFF070707),
        ),
      ),
    );
  }
}