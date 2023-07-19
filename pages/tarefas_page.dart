import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listaccb/model/tarefas.dart';

import '../repository/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];
  var descricaoController = TextEditingController();
  var apenasFaltantes = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async{
    if(apenasFaltantes) {
      _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    } else{
      _tarefas = await tarefaRepository.listarTarefas();
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: (){
        descricaoController.text = "";
        showDialog(context: context, builder: (BuildContext bc){
          return AlertDialog(
            title: const Text("Adicionar Tarefas"),
            content: TextField(
              controller: descricaoController,
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Cancelar")),
              TextButton(onPressed: () async{
                await tarefaRepository.adicionar(Tarefa(descricaoController.text, false));
                Navigator.pop(context);
                setState(() {
                  
                });
              }, child: const Text("Salvar"))
            ],
          );
        });
      }),
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ver Apenas os faltantes"),
                  Switch(value: apenasFaltantes, onChanged: (bool value) {
                    apenasFaltantes = value;
                    obterTarefas();
                  })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefa = _tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async{
                      await tarefaRepository.remove(tarefa.getId());
                      obterTarefas();
                    },
                    key: Key(tarefa.getId()),
                    child: ListTile(
                      title: Text(tarefa.getDescricao()),
                      trailing: Switch(onChanged: (bool value) async{
                        await tarefaRepository.alterar(tarefa.getId(), value);
                        obterTarefas();
                      },
                      value: tarefa.getConcluido(),),),
                  );
              }),
            ),
          ],
        ),
      ),
    );
  }
}