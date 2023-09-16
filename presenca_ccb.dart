import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/pages/dados_cadastrais/dados_cadastrais.dart';
import 'package:listaccb/pages/login_page.dart';
import 'pages/main_page.dart';
class PresencaCCB extends StatelessWidget {
  const PresencaCCB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color.fromARGB(230, 255, 254, 254),
        primarySwatch: Colors.brown, textTheme: GoogleFonts.robotoTextTheme()),
      home: const MainPage(),
    );
  }
}