import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/repository/checker_repository.dart';
import 'package:listaccb/repository/instrumentos_repository.dart';
import 'package:listaccb/utils/drawer.dart';
import 'package:listaccb/utils/text_label.dart';

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
  DateTime? dataPresenca;
  var comumCongregacaoController = TextEditingController(text: "");
  var cidadeController = TextEditingController(text: "");
  var ufController = TextEditingController(text: "");
  var cargoMinisterioController = TextEditingController(text: "");
  var tempoExp = 0;
  var instrumentosRepository = InstrumentosRepository();
  var checkerRepository = CheckerRepository();
  var checkerPresencaSelecionada = [];
  var instrumentos = [];
  var presenca = [];
  var instrumentoSelecionado = "";

  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState
    instrumentos = instrumentosRepository.retornaInstrumentos();
    presenca = checkerRepository.retornaCheckerPresenca();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cadastro de Dados"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        drawer: Drawer1(),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              child: salvando
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        TextLabel(
                          texto: "Nome:",
                        ),
                        TextField(
                          controller: nomeController,
                        ),
                        TextLabel(
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
                              dataPresenca = data;
                            }
                          },
                        ),
                        TextLabel(
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
                        TextLabel(
                          texto: "Comum Congregação:",
                        ),
                        TextField(
                          controller: comumCongregacaoController,
                        ),
                        TextLabel(
                          texto: "UF:",
                        ),
                        TextField(
                          controller: ufController,
                        ),
                        TextLabel(
                          texto: "Cidade:",
                        ),
                        TextField(
                          controller: cidadeController,
                        ),
                        TextLabel(
                          texto: "Cargo / Ministério",
                        ),
                        TextField(
                          controller: cargoMinisterioController,
                        ),
                        TextLabel(
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
                        Column(
                          children: instrumentos
                              .map((instrumento) => RadioListTile(
                                  title: Text(instrumento.toString()),
                                  selected:
                                      instrumentoSelecionado == instrumento,
                                  value: instrumento.toString(),
                                  groupValue: instrumentoSelecionado,
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      instrumentoSelecionado = value.toString();
                                    });
                                  }))
                              .toList(),
                        ),
                        TextButton(
                            onPressed: () {
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
                              if (dataPresenca == null) {
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

                              setState(() {
                                salvando = true;
                              });
                              Future.delayed(Duration(seconds: 2), () {
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
