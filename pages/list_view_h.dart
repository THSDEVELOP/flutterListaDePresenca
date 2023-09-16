import 'package:flutter/material.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network("https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",),
        Image.network("https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",),
        Image.network("https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",),
        Image.network("https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",),
        Image.network("https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",),
        Image.network("https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",),
      ],
    );
  }
}