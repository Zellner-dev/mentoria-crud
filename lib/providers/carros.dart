import 'package:crud/model/carro.dart';
import 'package:flutter/material.dart';

class Carros extends ChangeNotifier {
  final List<Carro> _carros = [
    Carro(nome: "Lancer", preco: 20000),
    Carro(nome: "Celta", preco: 20230),
    Carro(nome: "Gol", preco: 50230),
  ];

  List<Carro> get carros => _carros;

  void adicionar(String nome, String preco) {
    carros.add(Carro(nome: nome, preco: double.parse(preco)));
    notifyListeners();
  }

  void remover(int id) {
    int index = _carros.indexWhere((carro) => carro.id == id);
    _carros.removeAt(index);
    notifyListeners();
  }

  void editar(String novoNome, String novoPreco, int id) {
    int index = _carros.indexWhere((carro) => carro.id == id);
    _carros[index].nome = novoNome;
    _carros[index].preco = double.parse(novoPreco);
    notifyListeners();
  }
}