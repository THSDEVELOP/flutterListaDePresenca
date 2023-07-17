import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/pages/dados_cadastrais.dart';
import 'package:listaccb/pages/pagina_1.dart';
import 'package:listaccb/pages/pagina_2.dart';
import 'package:listaccb/pages/pagina_3.dart';
import 'package:listaccb/utils/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Area de trabalho"),
      ),
      drawer: const Drawer1(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPage = value;
                });
              },
              children: const [
                PageOne(),
                PageTwo(),
                PageTree(),
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: 0,
              items: const [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Controle", icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: "Cadastros", icon: Icon(Icons.add)),
              ])
        ],
      ),
    ));
  }
}
