import 'package:flutter/material.dart';
import 'package:myapp/Pages/TelaCarrinho.dart';

class TelaCompra extends StatefulWidget {
  const TelaCompra({super.key});

  @override
  State<TelaCompra> createState() => _TelaCompraState();
}

class _TelaCompraState extends State<TelaCompra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC4FFCE),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                size: 60,
                color: Color(0xFF000000),
              ),
              Icon(Icons.person, size: 60),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 20,
                color: Color(0xFFD76A1A),
              ),
              Icon(
                Icons.star,
                size: 20,
                color: Color(0xFFD76A1A),
              ),
              Icon(
                Icons.star,
                size: 20,
                color: Color(0xFFD76A1A),
              ),
              Icon(
                Icons.star,
                size: 20,
                color: Color(0xFFD76A1A),
              ),
              Icon(
                Icons.star,
                size: 20,
                color: Color(0xFFD76A1A),
              ),
            ],
          ),
          Text(
            'O REI PERVERSO',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Text(
            '30,00 R\$',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF0000),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Image.network(
            'https://m.media-amazon.com/images/I/91N9kjbqxWS._AC_UF1000,1000_QL80_.jpg',
            height: 410,
          ),
          SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Enviar Para:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: 'Inserir CEP'),
              ),
            ),
          ]),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'COMPRAR',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFFFFFFFF),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TelaCarrinho();
                  },
                ),
              );
            },
            child: const Text(
              'ADICIONAR AO CARRINHO',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
