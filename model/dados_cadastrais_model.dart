// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'dados_cadastrais_model.g.dart';

@HiveType(typeId: 0)
class DadosCadastraisModel extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  DateTime? dataCadastro;

  @HiveField(2)
  String? comumCongregacao;

  @HiveField(3)
  String? uf;

  @HiveField(4)
  String? cidade;

  @HiveField(5)
  String? cargoMinisterio;

  @HiveField(6)
  List<String> instrumentos = ["Clarinete", "Sax", "Trompete", "Violino"];

  DadosCadastraisModel();

  DadosCadastraisModel.vazio() {
    nome = "";
    dataCadastro = null;
    comumCongregacao = "";
    uf = "";
    cidade = "";
    cargoMinisterio = "";
    instrumentos = [];
  }


  @override
  String toString() {
    return 'DadosCadastraisModel(nome: $nome, dataCadastro: $dataCadastro, comumCongregacao: $comumCongregacao, uf: $uf, cidade: $cidade, cargoMinisterio: $cargoMinisterio, instrumentos: $instrumentos)';
  }
}
