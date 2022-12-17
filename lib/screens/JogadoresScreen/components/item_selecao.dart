import 'package:flutter/material.dart';

import '../../../models/jogador.dart';

class ItemJogador extends StatelessWidget {
  const ItemJogador({
    Key? key,
    required this.jogador,
    required this.onDismissed,
  }) : super(key: key);

  final Jogador jogador;
  final Function(Jogador jogador) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDismissed(jogador),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(
              jogador.url,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "${jogador.name} - Camisa: ${jogador.camisa}",
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            "Altura: ${jogador.altura}m  -  ${jogador.idade} anos",
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(
            Icons.person,
          ),
        ),
      ),
    );
  }
}
