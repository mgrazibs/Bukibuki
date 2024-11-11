import 'package:flutter/material.dart';
import 'package:myapp/Domain/CardContainer.dart';

class CardNome {
  final String nome;

  CardNome(this.nome);
}

class EstruturaCard extends StatefulWidget {
  final Cardcontainer cardContainer; 
  const EstruturaCard({super.key, required this.cardContainer});

  @override
  State<EstruturaCard> createState() => _EstruturaCardState();
}

class _EstruturaCardState extends State<EstruturaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2, top: 1, bottom: 1),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const ClipRRect(
            child: const Icon(
              Icons.book_outlined,
              size: 15,
              color: Color.fromRGBO(77, 104, 76, 1),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.cardContainer.nome,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}