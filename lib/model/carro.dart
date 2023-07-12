import 'dart:math';

class Carro {
  int id = Random().nextInt(100000);
  String nome;
  double preco;

  Carro({
    required this.nome,
    required this.preco,
  });
}
