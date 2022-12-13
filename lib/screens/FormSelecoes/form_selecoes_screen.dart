import 'package:flutter/material.dart';
import 'components/body_selecoes.dart';

class FormSelecoes extends StatelessWidget {
  const FormSelecoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Form Seleções'),
      ),
      body: const BodyFormSelecoes(),
    );
  }
}
