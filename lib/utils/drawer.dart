import 'package:flutter/material.dart';

import '../pages/dados_cadastrais.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text("Dados Cadastrais")),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DadosCadastraisPage(
                              )));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text("Lista de Presença")),
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text("Termos de Privacidade")),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text("Configurações")),
                onTap: () {},
              ),
            ],
          ),
        ),
    );
  }
}