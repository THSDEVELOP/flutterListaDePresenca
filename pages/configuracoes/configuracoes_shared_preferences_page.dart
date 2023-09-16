import 'package:flutter/material.dart';

import '../../service/app_storage_service.dart';

class ConfiguracoesSharedPreferencesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferencesPage({super.key});

  @override
  State<ConfiguracoesSharedPreferencesPage> createState() => _ConfiguracoesSharedPreferencesPageState();
}

class _ConfiguracoesSharedPreferencesPageState extends State<ConfiguracoesSharedPreferencesPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

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
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await (storage.getConfiguracoesAltura())).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacao();
    temaEscuro = await storage.getConfiguracoesModoEscuro();

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
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
                  receberNotificacoes = !receberNotificacoes;
                });
              },
              value: receberNotificacoes,
            ),
            SwitchListTile(
              title: Text("Modo Escuro"),
              onChanged: (bool value) {
                setState(() {
                  temaEscuro = !temaEscuro;
                });
              },
              value: temaEscuro,
            ),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await storage.setConfiguracoesNomeUsuario(
                      nomeUsuarioController.text);
                  try {
                    await storage.setConfiguracoesAltura(
                        double.parse(alturaController.text));
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
                  await storage.setConfiguracoesReceberNotificacao(
                      receberNotificacoes);
                  await storage.setConfiguracoesModoEscuro(temaEscuro);
                  Navigator.pop(context);
                },
                child: Text("Salvar")),
          ],
        ),
      ),
    ));
  }
}
