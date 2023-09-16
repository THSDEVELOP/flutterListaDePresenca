import '../model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail2> get() async {
    await Future.delayed(const Duration(seconds: 2));
    return CardDetail2(
    "Meu primeiro Card",
    "https://congregacaocristanobrasil.org.br/assets/images/logo-ccb-light.png",
    "Testando, Testando, Testando, Testando, Testando, Testando, Testando, Testando, Testando",
    );
  }
}