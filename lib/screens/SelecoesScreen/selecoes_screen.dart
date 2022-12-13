import 'package:copa_app/screens/SelecoesScreen/components/body_selecoes.dart';
import 'package:flutter/material.dart';

class SelecoesScreen extends StatelessWidget {
  const SelecoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('List the Seleções'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form_selecoes');
            },
            icon: const Icon(
              Icons.arrow_forward_outlined,
            ),
          ),
        ],
      ),
      body: const BodySelecoes(),
    );
  }
}
