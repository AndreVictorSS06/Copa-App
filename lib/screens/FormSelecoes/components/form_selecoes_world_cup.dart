import 'package:flutter/material.dart';

import '../../../widgets/default_button.dart';

class FormSelecoesWorldCup extends StatefulWidget {
  const FormSelecoesWorldCup({super.key});

  @override
  State<FormSelecoesWorldCup> createState() => _FormSelecoesWorldCupState();
}

class _FormSelecoesWorldCupState extends State<FormSelecoesWorldCup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name to Pais: '),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Continente: '),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Quantidade de Títulos: ',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Cores: '),
          ),
          const SizedBox(
            height: 10,
          ),
          DefaultButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
