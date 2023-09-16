import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:listaccb/model/configuracoes_model.dart';
import 'package:listaccb/repository/configuracoes_repository.dart';

import '../../service/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA ";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_MODO_ESCURO = "CHAVE_MODO_ESCURO";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Configurações Hive"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(hintText: "Nome do Usuário:"),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Altura"),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
              title: Text("receber notificações"),
              onChanged: (bool value) {
                setState(() {
                  configuracoesModel.receberNotificacoes = value;
                });
              },
              value: configuracoesModel.receberNotificacoes,
            ),
            SwitchListTile(
              title: Text("Modo Escuro"),
              onChanged: (bool value) {
                setState(() {
                  configuracoesModel.temaEscuro = value;
                });
              },
              value: configuracoesModel.temaEscuro,
            ),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                  try {
                    configuracoesModel.altura =
                        double.parse(alturaController.text);
                  } catch (e) {
                    showDialog(context: context, builder: (_) {
                      return AlertDialog(
                        title: Text("Meu App"),
                        content: Text("Favor informar um número válido"),
                        actions: [TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("OK"))],
                      );
                    });
                    return;
                  }
                  configuracoesRepository.salvar(configuracoesModel);
                  Navigator.pop(context);
                },
                child: Text("Salvar")),
          ],
        ),
      ),
    ));
  }
}
