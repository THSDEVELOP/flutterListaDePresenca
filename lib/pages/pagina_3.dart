import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTree extends StatefulWidget {
  const PageTree({super.key});

  @override
  State<PageTree> createState() => _PageTreeState();
}

class _PageTreeState extends State<PageTree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 226, 60, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("", style: GoogleFonts.acme(fontSize: 22, color: Colors.white),),
              ],
            ),
          ),
    ));
  }
}