import 'package:flutter/material.dart';
import 'package:myapp/Domain/EstruturaCard.dart';
import 'package:myapp/bd/Database.dart';

class Bukibuki extends StatefulWidget {
  const Bukibuki({super.key});

  @override
  State<Bukibuki> createState() => _BukibukiState();
}

class _BukibukiState extends State<Bukibuki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 151, 85),
        title: const Text(
          'Gêneros',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Text(
              'Literatura Brasileira',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 115, 124, 119),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: BancoDeDados.containersLB.length,
              itemBuilder: (context, i) {
                return EstruturaCard(
                  cardContainer: BancoDeDados.containersLB[i],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Text(
              'Literatura Estrangeira',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 115, 124, 119),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: BancoDeDados.containersLE.length,
              itemBuilder: (context, i) {
                return EstruturaCard(
                  cardContainer: BancoDeDados.containersLE[i],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
