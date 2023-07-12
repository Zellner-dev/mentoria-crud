// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:crud/model/carro.dart';

class CarroListTile extends StatelessWidget {

  final Carro carro;
  final void Function(int id) remover;
  final void Function() editar;

  const CarroListTile({
    Key? key,
    required this.carro,
    required this.remover, 
    required this.editar, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(carro.nome),
        subtitle: Text("R\$${carro.preco.toStringAsFixed(2)}"),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width / 100 * 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: editar, 
                icon: const Icon(Icons.edit, color: Colors.blue,)
              ),
              IconButton(
                onPressed: () => remover(carro.id), 
                icon: const Icon(Icons.delete, color: Colors.red,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
