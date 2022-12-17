import 'package:flutter/material.dart';
import 'components/body_selecoes.dart';

class FormSelecoesScreen extends StatelessWidget {
  const FormSelecoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/selecoes');
          },
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        ),
        centerTitle: true,
        title: const Text('Form Seleções'),
      ),
      body: const BodyFormSelecoes(),
    );
  }
}
