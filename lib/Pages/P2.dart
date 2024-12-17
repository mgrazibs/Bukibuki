import 'package:flutter/material.dart';
import 'package:projeto/P1.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4f6fc),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.person, size: 40, color: Color(0xff000000)),
              SizedBox(width: 20),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisa...',
                        contentPadding: EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => {},
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHmkcR1BUTUEMz3gtzlkRM2Lb73oWVcU7S0A&s',
                  height: 140),
              Text('O HOBBIT',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 20)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'J.R.R Tolkien',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '50,90 R\$',
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            Icon(Icons.star, size: 12, color: Color(0xFFD76A1A)),
            Icon(Icons.star, size: 12, color: Color(0xFFD76A1A)),
            Icon(Icons.star, size: 12, color: Color(0xFFD76A1A)),
            Icon(Icons.star, size: 12, color: Color(0xFFD76A1A)),
            Icon(Icons.star, size: 12, color: Color(0xFFd9d9d9)),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
                  'Adicionar ao carrinho',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFd9d9d9),
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
                      return Tela();
                    }),
                  );
                },
                child: const Text(
                  'Página inicial',
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