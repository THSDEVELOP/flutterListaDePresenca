import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail2 cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  cardDetail.url,
                  height: 120,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              cardDetail.title,
              style: GoogleFonts.acme(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              cardDetail.text,
              textAlign: TextAlign.justify,
              style: GoogleFonts.acme(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
