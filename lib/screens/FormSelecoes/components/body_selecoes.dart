import 'package:flutter/material.dart';

import 'form_selecoes_world_cup.dart';

class BodyFormSelecoes extends StatelessWidget {
  const BodyFormSelecoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Resgistration \nSoccer Selections: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            FormSelecoesWorldCup(),
          ],
        ),
      ),
    );
  }
}
