import 'package:flutter/material.dart';

import 'components/body_form_jogadores.dart';

class FormJogadoreScreen extends StatelessWidget {
  const FormJogadoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/jogadores');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: const Text('Form Jogadores'),
      ),
      body: const BodyFormJogadores(),
    );
  }
}
