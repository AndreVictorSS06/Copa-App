import 'package:copa_app/models/jogador.dart';
import 'package:copa_app/services/services_api_jogador.dart';
import 'package:flutter/material.dart';

import 'item_selecao.dart';

class BodyJogadores extends StatefulWidget {
  const BodyJogadores({super.key});

  @override
  State<BodyJogadores> createState() => _BodyJogadoresState();
}

class _BodyJogadoresState extends State<BodyJogadores> {
  late JogadorApi _jogadorApi;

  @override
  void initState() {
    super.initState();

    _jogadorApi = JogadorApi();
    setState(() {});
  }

  Future<void> _removeJogador(Jogador jogador) async {
    await _jogadorApi.deleteJogador(jogador.id!);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        elevation: 5,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        content: Text('Jogador Removido!'),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Jogador>>(
      future: _jogadorApi.getSelecoes(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            final jogador = snapshot.data![index];
            return ItemJogador(
              jogador: jogador,
              onDismissed: _removeJogador,
            );
          },
        );
      },
    );
  }
}
