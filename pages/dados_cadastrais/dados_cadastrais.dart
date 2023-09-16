import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/repository/checker_repository.dart';
import 'package:listaccb/repository/instrumentos_repository.dart';
import 'package:listaccb/utils/drawer.dart';
import 'package:listaccb/utils/text_label.dart';

import '../../service/app_storage_service.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  String dropDownValue = "Clarinete";
  var items = ["Clarinete", "Sax", "Trompete", "Violino"];
  var nomeController = TextEditingController(text: "");
  var dataPresencaController = TextEditingController(text: "");
  DateTime? dataCadastro;
  var comumCongregacaoController = TextEditingController(text: "");
  var cidadeController = TextEditingController(text: "");
  var ufController = TextEditingController(text: "");
  var cargoMinisterioController = TextEditingController(text: "");
  var tempoExp = 0;
  var instrumentosRepository = InstrumentosRepository();
  var checkerRepository = CheckerRepository();
  List<String> checkerPresencaSelecionada = [];
  var instrumentos = [];
  var presenca = [];
  List<String> instrumentoSelecionado = [];
  AppStorageService storage = AppStorageService();
  final String CHAVES_DADOS_CADASTRAIS_NOME = "CHAVES_DADOS_CADASTRAIS_NOME";
  final String CHAVES_DADOS_CADASTRAIS_DATA_PRESENCA =
      "CHAVES_DADOS_CADASTRAIS_DATA_PRESENCA";
  final String CHAVES_DADOS_CADASTRAIS_PRESENCA =
      "CHAVES_DADOS_CADASTRAIS_PRESENCA";
  final String CHAVES_DADOS_CADASTRAIS_COMUM_CONGREGACAO =
      "CHAVES_DADOS_CADASTRAIS_COMUM_CONGREGACAO";
  final String CHAVES_DADOS_CADASTRAIS_UF = "CHAVES_DADOS_CADASTRAIS_UF";
  final String CHAVES_DADOS_CADASTRAIS_CIDADE =
      "CHAVES_DADOS_CADASTRAIS_CIDADE";
  final String CHAVES_DADOS_CADASTRAIS_CARGO_MINISTERIO =
      "CHAVES_DADOS_CADASTRAIS_CARGO_MINISTERIO";
  final String CHAVES_DADOS_CADASTRAIS_INSTRUMENTO =
      "CHAVES_DADOS_CADASTRAIS_INSTRUMENTO";

  bool salvando = false;

  @override
  void initState() {
    instrumentos = instrumentosRepository.retornaInstrumentos();
    presenca = checkerRepository.retornaCheckerPresenca();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeController.text = await storage.getDadosCadastraisNome();
    dataPresencaController.text = await storage.getDadosCadastraisDataPresenca();
    dataCadastro = DateTime.tryParse(dataPresencaController.text);
    checkerPresencaSelecionada = await storage.getDadosCadastraisPresenca();
    comumCongregacaoController.text = await storage.getDadosCadastraisComumCongregacao();
    ufController.text = await storage.getDadosCadastraisUF();
    cidadeController.text = await storage.getDadosCadastraisCidade();
    cargoMinisterioController.text = await storage.getDadosCadastraisCargoMinisterio();
    instrumentoSelecionado = await storage.getDadosCadastraisInstrumento();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cadastro de Dados"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        drawer: const Drawer1(),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              child: salvando
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        const TextLabel(
                          texto: "Nome:",
                        ),
                        TextField(
                          controller: nomeController,
                        ),
                        const TextLabel(
                          texto: "Data da Presença:",
                        ),
                        TextField(
                          controller: dataPresencaController,
                          readOnly: true,
                          onTap: () async {
                            var data = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2023, 7, 16),
                                firstDate: DateTime(2017, 1, 1),
                                lastDate: DateTime(2029, 1, 1));

                            if (data != null) {
                              dataPresencaController.text = data.toString();
                              dataCadastro = data;
                            }
                          },
                        ),
                        const TextLabel(
                          texto: "Presença",
                        ),
                        Column(
                            children: presenca
                                .map(
                                  (checar) => CheckboxListTile(
                                      title: Text(checar.toString()),
                                      value: checkerPresencaSelecionada
                                          .contains(checar),
                                      onChanged: (bool? value) {
                                        if (value!) {
                                          setState(() {
                                            checkerPresencaSelecionada
                                                .add(checar);
                                          });
                                        } else {
                                          setState(() {
                                            checkerPresencaSelecionada
                                                .remove(checar);
                                          });
                                        }
                                      }),
                                )
                                .toList()),
                        const TextLabel(
                          texto: "Comum Congregação:",
                        ),
                        TextField(
                          controller: comumCongregacaoController,
                        ),
                        const TextLabel(
                          texto: "UF:",
                        ),
                        TextField(
                          controller: ufController,
                        ),
                        const TextLabel(
                          texto: "Cidade:",
                        ),
                        TextField(
                          controller: cidadeController,
                        ),
                        const TextLabel(
                          texto: "Cargo / Ministério",
                        ),
                        TextField(
                          controller: cargoMinisterioController,
                        ),
                        const TextLabel(
                          texto: "Instrumento",
                        ),
                        DropdownButton(
                          items: items.map((itemsname) {
                            return DropdownMenuItem(
                                value: itemsname, child: Text(itemsname));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropDownValue = newValue.toString();
                            });
                          },
                          value: dropDownValue,
                        ),
                        TextButton(
                            onPressed: () async{
                              setState(() {
                                salvando = false;
                              });
                              if (nomeController.text.trim().length < 3) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "O nome deve ser preenchido com 3 ou mais caracteres")));
                                return;
                              }
                              if (dataCadastro == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Data de presença inválida")));
                                return;
                              }
                              if (comumCongregacaoController.text
                                      .trim()
                                      .length ==
                                  "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "A comum deve ser escrita caso não tenha digite 'Vazio'.")));
                                return;
                              }
                              if (ufController.text.trim().length == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "O Estado deve ser preenchido")));
                                return;
                              }
                              if (cidadeController.text.trim().length == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "A cidade deve ser preenchida")));
                                return;
                              }
                              if (presenca.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "o campo de presença ou falta deve ser preenchida")));
                                return;
                              }

                              await storage.setDadosCadastraisNome(
                                  nomeController.text);

                              await storage.setDadosCadastraisDataPresenca(
                                  dataPresencaController.text);

                              await storage.setDadosCadastraisPresenca(
                                  checkerPresencaSelecionada);

                              await storage.setDadosCadastraisComumCongregacao(
                                  comumCongregacaoController.text);

                              await storage.setDadosCadastraisUF(
                                  ufController.text);

                              await storage.setDadosCadastraisCidade(
                                  cidadeController.text);

                              await storage.setDadosCadastraisCargoMinisterio(
                                  cargoMinisterioController.text);

                              await storage.setDadosCadastraisInstrumento(instrumentoSelecionado);

                              setState(() {
                                salvando = true;
                              });
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  salvando = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Dados salvos com sucesso.")));
                                });
                                Navigator.pop(context);
                              });
                            },
                            child: Text(
                              "SALVAR",
                              style: GoogleFonts.acme(
                                  fontSize: 18, color: Colors.black),
                            ))
                      ],
                    )),
        ),
      ),
    );
  }
}
