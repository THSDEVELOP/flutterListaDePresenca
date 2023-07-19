import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
            width: double.infinity,
            color: Colors.brown,
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