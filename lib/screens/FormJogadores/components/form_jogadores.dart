import 'package:copa_app/models/jogador.dart';
import 'package:copa_app/services/services_api_jogador.dart';
import 'package:copa_app/widgets/default_button.dart';
import 'package:flutter/material.dart';

class FormJogadores extends StatefulWidget {
  const FormJogadores({super.key});

  @override
  State<FormJogadores> createState() => _FormJogadoresState();
}

class _FormJogadoresState extends State<FormJogadores> {
  final _formKey = GlobalKey<FormState>();

  late JogadorApi _jogadorApi;

  final nameJogadorController = TextEditingController();
  final camisaJogadorController = TextEditingController();
  final alturaJogadorController = TextEditingController();
  final idadeJogadorController = TextEditingController();
  final urlJogadorController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _jogadorApi = JogadorApi();
  }

  Future<void> _saveJogador() async {
    if (_formKey.currentState!.validate()) {
      final jogador = Jogador(
        name: nameJogadorController.text,
        altura: double.parse(alturaJogadorController.text),
        idade: int.parse(idadeJogadorController.text),
        url: urlJogadorController.text,
        camisa: int.parse(camisaJogadorController.text),
      );
      await _jogadorApi.addJogador(jogador);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameJogadorController,
              decoration: const InputDecoration(labelText: 'Name: '),
            ),
            TextFormField(
              controller: camisaJogadorController,
              decoration: const InputDecoration(
                labelText: 'Número da Camisa: ',
              ),
            ),
            TextFormField(
              controller: alturaJogadorController,
              decoration: const InputDecoration(labelText: 'Altura: '),
            ),
            TextFormField(
              controller: idadeJogadorController,
              decoration: const InputDecoration(labelText: 'Idade: '),
            ),
            TextFormField(
              controller: urlJogadorController,
              decoration: const InputDecoration(labelText: 'Url Image: '),
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultButton(
              onPressed: () {
                _saveJogador();
              },
              label: 'Salvar',
            )
          ],
        ),
      ),
    );
  }
}
