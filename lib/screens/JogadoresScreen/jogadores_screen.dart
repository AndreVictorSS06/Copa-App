import 'package:flutter/material.dart';

import 'components/body_jogadores.dart';

class JogadoresScreen extends StatelessWidget {
  const JogadoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/selecoes');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        centerTitle: true,
        title: const Text('Jogadores'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form_jogadores');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const BodyJogadores(),
    );
  }
}
