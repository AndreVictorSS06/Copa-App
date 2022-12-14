import 'package:copa_app/screens/SelecoesScreen/components/body_selecoes.dart';
import 'package:flutter/material.dart';

class SelecoesScreen extends StatelessWidget {
  const SelecoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('List the Seleções'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form_selecoes');
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: const BodySelecoes(),
    );
  }
}
