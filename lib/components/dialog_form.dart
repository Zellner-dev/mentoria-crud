// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DialogForm extends StatefulWidget {
  final int? id;
  final String title;
  final String primeiraLabel;
  final String primeiraHint;
  final String segundaLabel;
  final String segundaHint;
  final void Function(String nome, String preco) acaoASerExecutada;

  const DialogForm({
    Key? key,
    this.id,
    required this.title,
    required this.primeiraLabel,
    required this.primeiraHint,
    required this.segundaLabel,
    required this.segundaHint,
    required this.acaoASerExecutada,
  }) : super(key: key);

  @override
  State<DialogForm> createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _submit() {
    
    if(!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    widget.acaoASerExecutada(
      _formData["primeiroParam"].toString(), 
      _formData["segundoParam"].toString(), 
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("cuidado com o que digita"),
            TextFormField(
              decoration: InputDecoration(
                label: Text(widget.primeiraLabel),
                hintText: widget.primeiraHint
              ),
              validator: (value) => value == "" 
                ? "Valor nao pode ser vazio." 
                : null,
              onSaved: (newValue) => _formData["primeiroParam"] = newValue!,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(widget.segundaLabel),
                hintText: widget.segundaHint,
              ),
              validator: (value) {
                if(value == "") {
                  return "Valor não pode ser vazio.";
                }
                try{
                  double.parse(value!);
                  return null;
                } catch (_) {
                  return "Deve ser um número.";
                }
              },
              onSaved: (newValue) => _formData["segundoParam"] = newValue!,
            ),
            ElevatedButton(onPressed: _submit, child: const Text("Confirmar"))
          ],
        ),
      ),
    );
  }
}