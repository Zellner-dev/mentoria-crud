import 'package:crud/components/carro_list_tile.dart';
import 'package:crud/components/dialog_form.dart';
import 'package:crud/providers/carros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrosPage extends StatefulWidget {
  const CarrosPage({super.key});

  @override
  State<CarrosPage> createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Carros>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de carros"),
      ),
      body: provider.carros.isEmpty
      ? const Center(child: Text("Nenhum carro registrado."),)
      : ListView.builder(
        itemCount: provider.carros.length,
        itemBuilder: (context, index) {
          return CarroListTile(
            carro: provider.carros[index],
            remover: provider.remover,
            editar: () => showDialog(
              context: context, 
              builder: (context) {
                return DialogForm(
                  title: "Editar produto",
                  primeiraLabel: "Novo nome",
                  primeiraHint: "Lancer",
                  segundaLabel: "Novo preço",
                  segundaHint: "35000.00",
                  id: provider.carros[index].id,
                  funcao: provider.editar,
                );
              } 
            )
          );
        },
      )
    );
  }
}