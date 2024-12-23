import 'package:flutter/material.dart';
import 'package:myapp/Domain/pacote_literatura.dart';

class DetailPage extends StatefulWidget {
  final PacoteLiteratura pacoteLiteratura;
  const DetailPage({super.key, required this.pacoteLiteratura});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 248, 227),
        borderRadius: BorderRadius.circular(12), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.pacoteLiteratura.urlImage, 
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              const Icon(
                Icons.book_outlined,
                size: 20,
                color: Color.fromRGBO(77, 104, 76, 1),
              ),
              const SizedBox(width: 12),
              Text(
                widget.pacoteLiteratura.titulo,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.pacoteLiteratura.descricao,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(20, 20, 20, 1),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
