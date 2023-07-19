import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/pages/login_page.dart';

import '../pages/dados_cadastrais.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return const Wrap(
                      children: [
                        ListTile(
                          title: Text("Câmera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          title: Text("Galeria"),
                          leading: Icon(Icons.album),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 138, 133, 133)),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/480px-User_icon_2.svg.png")),
                accountName: const Text("Renato Rodrigues"),
                accountEmail: const Text("@")),
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.person_add),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cadastro de Dados"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.book),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Lista de Presença"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.event_available),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Criar novo evento"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.book_online),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de Privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 12, horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            "Termos de Privacidade",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.acme(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "É importante questionar o quanto a execução dos pontos do programa oferece uma interessante oportunidade para verificação dos procedimentos normalmente adotados.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.acme(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 30,
                      title: const Text("Lista CCB"),
                      content: const Wrap(
                        children: [
                          Text("Você sairá do aplicativo!"),
                          Text("Realmente deseja Sair?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não"))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
