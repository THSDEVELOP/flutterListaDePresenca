import '../model/tarefas.dart';

class TarefaRepository {
  List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async{
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async{
    await Future.delayed(const Duration(milliseconds: 10));
    _tarefas.where((tarefa) => tarefa.getId() == id).first.setConcluido(concluido);
  }

  Future<void> remove(String id) async{
    await Future.delayed(const Duration(milliseconds: 10));
    _tarefas.remove(
    _tarefas.where((tarefa) => tarefa.getId() == id).first);
  }

  Future<List<Tarefa>> listarTarefas() async{
    await Future.delayed(const Duration(milliseconds: 10));
    return _tarefas;
  }

  Future<List<Tarefa>> listarTarefasNaoConcluidas() async{
    await Future.delayed(const Duration(milliseconds: 10));
    return _tarefas.where((tarefa) => !tarefa.getConcluido()).toList();
  }
}