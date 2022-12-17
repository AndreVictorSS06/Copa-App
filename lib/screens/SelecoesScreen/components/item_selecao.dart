import 'package:flutter/material.dart';

import '../../../models/selecoes.dart';

class ItemSelecao extends StatelessWidget {
  const ItemSelecao({
    Key? key,
    required this.selecoes,
    required this.onDismissed,
  }) : super(key: key);

  final Function(Selecoes selecao) onDismissed;

  final Selecoes selecoes;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 10),
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDismissed(selecoes),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(
              selecoes.urlImage,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "${selecoes.name} - ${selecoes.continente} ",
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            "Cores: ${selecoes.cores}",
            textAlign: TextAlign.center,
          ),
          trailing: Text(
            "Títulos: \n${selecoes.qtdTitulos}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
