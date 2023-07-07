import 'dart:math';

class GeradorNumeroRandomService {

  static int geranumeroRandom(int nMax) {
    Random numeroRandom = Random();
    return numeroRandom.nextInt(100);
  }
}