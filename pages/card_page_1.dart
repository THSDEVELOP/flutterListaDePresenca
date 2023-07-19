import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listaccb/pages/card_detail_page.dart';
import 'package:listaccb/utils/text_label.dart';
import '../model/card_detail.dart';

class CardPage1 extends StatefulWidget {
  const CardPage1({super.key});

  @override
  State<CardPage1> createState() => _CardPage1State();
}

class _CardPage1State extends State<CardPage1> {
  var cardDetail = CardDetail2(
    "Meu primeiro Card",
    "https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",
    "Testando, Testando, Testando, Testando, Testando, Testando, Testando, Testando, Testando",
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardDetailPage(cardDetail: cardDetail,)));
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          cardDetail.url,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(cardDetail.title),
                      ],
                    ),
                    Text(
                      cardDetail.text,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Ler mais",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            )))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
