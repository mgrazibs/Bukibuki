import 'package:flutter/material.dart';
import 'package:myapp/pages/TelaCompra.dart';
import 'package:myapp/domain/domain.dart';
import 'package:myapp/bd/pacote_dao.dart';
import 'package:myapp/pages/register_package.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  List<CompraLivro> pacotes = [];
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    pacotes = await PacoteDao().listarPacotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC4FFCE),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.black,
                  )),
              Text(
                'CARRINHO',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              Icon(Icons.person, size: 60),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: pacotes.length,
            itemBuilder: (context, index) {
              return buildLivro(pacotes[index]);
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TelaCompra();
                      },
                    ),
                  );
                },
                child: const Text(
                  'EXCLUIR',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFFFFFFF),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'SALVAR PARA MAIS TARDE',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFFFFFFF),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Text(
            'SUBTOTAL: ${calcularSubtotal().toStringAsFixed(2)} R\$',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegisterPackage();
                  },
                ),
              ).then(
                    (value) async {
                  await loadData();
                  setState(() {});
                },
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            child: const Text(
              'Comprar',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }


  buildLivro(CompraLivro livro) {
    return Column(
      children: [
        Text(
          livro.titulo,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Text(
          '${livro.valor} R\$',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF0000),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Image.network(
          livro.urlImage,
          height: 200,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (livro.cont > 0) {
                      livro.cont--;
                    }
                  });
                },
                icon: Icon(
                  Icons.delete,
                  size: 60,
                  color: Color(0xFFBB0A0A),
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: Color(0xFF5A625A),
              child: Text(
                '${livro.cont}',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    livro.cont++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 60,
                  color: Color(0xFF22AF06),
                )),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }

  double calcularSubtotal() {
    double subtotal = 0.0;
    for (var pacote in pacotes) {
      subtotal += pacote.valor * pacote.cont;
    }
    return subtotal;
  }
}
