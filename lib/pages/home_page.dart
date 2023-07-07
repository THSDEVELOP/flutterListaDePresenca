import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/gerador_numero_random.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroG = 0;
  var quantidadeClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lista de Presença CCB",
            style: GoogleFonts.pacifico(),
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Chamadas de Presença",
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "$quantidadeClicks Perfis Cadastrados",
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "$numeroG Cadastro de Perfis",
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white54,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Color.fromARGB(255, 245, 233, 130),
                        child: Text(
                        "Nome:",
                        style: GoogleFonts.acme(fontSize: 20),
                                    ),
                      ),
                    ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Color.fromARGB(255, 245, 233, 130),
                      child: Text(
                        "|  Instrumento",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: const Color.fromARGB(255, 245, 233, 130),
                      child: Text(
                        "|  Comum",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ),
                  ],),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.person_add),
          onPressed: () {
            setState(() {
              quantidadeClicks = quantidadeClicks + 1;
              numeroG = GeradorNumeroRandomService.geranumeroRandom(232);
            });
          },
        ));
  }
}
