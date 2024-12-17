import 'package:flutter/material.dart';


class Projeto extends StatefulWidget {
  const Projeto({super.key});


  @override
  State<Projeto> createState() => _ProjetoState();
}

class _ProjetoState extends State<Projeto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://yata-apix-91ee931a-776c-41e7-b199-fef7a4d55e9e.s3-object.locaweb.com.br/e36fe332a9554950bb9a8c7f1fe612e3.png'
              ),
            ),
          ),
        ),
      ),
    );
  }
}