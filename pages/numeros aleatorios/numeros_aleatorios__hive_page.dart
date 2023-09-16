import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../service/app_storage_service.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int? ngerado = 0;
  int? qtdCliks = 0;
  final CHAVE_NGERADO = "Numero_Aleatorio";
  final CHAVE_QTD_CLICKS = "Numero_de_cliques";
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if(Hive.isBoxOpen("Box_numeros_aleatorios")) {
      boxNumerosAleatorios = await Hive.openBox("Box_numeros_aleatorios");
    }else {
      boxNumerosAleatorios = await Hive.openBox("Box_numeros_aleatorios");
    }
    ngerado = await boxNumerosAleatorios.get('ngerado') ?? 0;
    qtdCliks = await boxNumerosAleatorios.get('qtdCliks') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("HIVE"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ngerado == null ? "Nenhum numero gerado" : ngerado.toString()),
            Text(qtdCliks == null
                ? "Não há clicks até o momento"
                : qtdCliks.toString())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              ngerado = random.nextInt(100);
              qtdCliks = (qtdCliks ?? 0) + 1;
            });
            boxNumerosAleatorios.put('ngerado', ngerado);
            boxNumerosAleatorios.put("qtdCliks", qtdCliks);
          }),
    ));
  }
}
