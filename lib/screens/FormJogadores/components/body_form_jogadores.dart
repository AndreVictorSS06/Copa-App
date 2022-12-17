import 'package:copa_app/screens/FormJogadores/components/form_jogadores.dart';
import 'package:flutter/material.dart';

class BodyFormJogadores extends StatelessWidget {
  const BodyFormJogadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Registrar Jogadores',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Icon(
          Icons.person,
          size: 100,
          color: Colors.deepPurple,
        ),
        SizedBox(height: 30),
        FormJogadores(),
      ],
    );
  }
}
