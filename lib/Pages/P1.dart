import 'package:flutter/material.dart';
import 'package:projeto/P2.dart';
import 'package:projeto/bd/database.dart';
import 'package:projeto/domain/card_livro.dart';
import 'package:projeto/widgets/detail_livros.dart';
import 'package:projeto/cadastro.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});
  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4f6fc),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: Database.pacotes.length,
            itemBuilder: (context, index) {
              return DetailLivros(livro: Database.pacotes[index]);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Pesquisa();
                    }),
                  );
                },
                child: const Text(
                  'Mais vendidos',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFf4f6fc),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return cadastro();
                    }),
                  );
                },
                child: const Text(
                  'Avaliação',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFf4f6fc),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}