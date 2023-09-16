import 'dart:math';
import 'package:flutter/material.dart';
import '../../service/app_storage_service.dart';

class NumerosAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumerosAleatoriosSharedPreferencesPage({super.key});

  @override
  State<NumerosAleatoriosSharedPreferencesPage> createState() => _NumerosAleatoriosSharedPreferencesPageState();
}

class _NumerosAleatoriosSharedPreferencesPageState extends State<NumerosAleatoriosSharedPreferencesPage> {
  int? ngerado = 0;
  int? qtdCliks = 0;
  final CHAVE_NGERADO = "Numero_Aleatorio";
  final CHAVE_QTD_CLICKS = "Numero_de_cliques";
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async{
    ngerado = await storage.getGeradorNgerado();
      qtdCliks = await storage.getGeradorQTDClciks();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Gerador de Numeros"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ngerado == null ? "Nenhum numero gerado" : ngerado.toString()),
            Text(qtdCliks == null ? "Não há clicks até o momento" : qtdCliks.toString())
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              var random = Random();
              setState(() {
                ngerado = random.nextInt(100);
                qtdCliks = (qtdCliks ?? 0) + 1;
              });
              storage.setGeradorNgerado(ngerado!);
              storage.setGeradorQTDClciks(qtdCliks!);
            }),
    ));
  }
}
