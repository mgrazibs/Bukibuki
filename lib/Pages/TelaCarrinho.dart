import 'package:flutter/material.dart';
import 'package:myapp/pages/TelaCompra.dart';
import 'package:myapp/domain/domain.dart';
import 'package:myapp/bd/pacote_dao.dart';
import 'package:myapp/Pages/map_page.dart';
import 'package:myapp/pages/register_package.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  late Future<List<CompraLivro>> futurePacotes;

  @override
  void initState() {
    super.initState();
    futurePacotes = loadData();
  }

  Future<List<CompraLivro>> loadData() async {
    return await PacoteDao().listarPacotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC4FFCE),
      body: FutureBuilder<List<CompraLivro>>(
        future: futurePacotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Ocorreu um erro!'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<CompraLivro> pacotes = snapshot.data!;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back,
                          size: 40, color: Colors.black),
                    ),
                    const Text(
                      'CARRINHO',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Icon(Icons.person, size: 40),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: pacotes.length,
                  itemBuilder: (context, index) {
                    return buildLivro(pacotes[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'SUBTOTAL: ${calcularSubtotal(pacotes).toStringAsFixed(2)} R\$',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPackage()),
                  ).then((_) {
                    setState(() {
                      futurePacotes = loadData();
                    });
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text(
                  'Comprar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget buildLivro(CompraLivro livro) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            livro.titulo,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Text(
            '${livro.valor.toStringAsFixed(2)} R\$',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          Text(
            livro.cidade,
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () async {
              List<Location> locations =
                  await locationFromAddress(livro.cidade);
              if (locations.isNotEmpty) {
                Location location = locations.first;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(
                        lat: location.latitude, long: location.longitude),
                  ),
                );
              }
            },
            child: Text(
              'Ver no mapa',
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8),
          Image.network(
            livro.urlImage,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (livro.cont > 0) livro.cont--;
                  });
                },
                icon: const Icon(Icons.delete, size: 40, color: Colors.red),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                color: Colors.green.shade700,
                child: Text(
                  '${livro.cont}',
                  style: const TextStyle(
                      fontSize: 24,
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
                icon: const Icon(Icons.add, size: 40, color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  double calcularSubtotal(List<CompraLivro> pacotes) {
    return pacotes.fold(
        0.0, (total, livro) => total + (livro.valor * livro.cont));
  }
}
