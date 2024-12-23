import 'package:flutter/material.dart';
import 'package:myapp/Domain/pacote_literatura.dart';
import 'package:myapp/Pages/detail_page.dart';
import 'package:myapp/Pages/register_package.dart';
import 'package:myapp/bd/pacote_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PacoteLiteratura> pacotes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    pacotes = await PacoteDao().listarPacotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 150, 204, 145),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 114, 180, 118),
        title: const Text(
          'Literatura',
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
          Expanded(
            child: ListView.builder(
              itemCount: pacotes.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(pacoteLiteratura: pacotes[i]),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(pacotes[i].titulo),
                      subtitle: Text(pacotes[i].descricao),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF3F68F7),
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
          },
        );
      },
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
