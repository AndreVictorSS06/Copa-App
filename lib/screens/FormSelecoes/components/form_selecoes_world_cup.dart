import 'package:copa_app/models/selecoes.dart';
import 'package:flutter/material.dart';

import '../../../services/service_api.dart';
import '../../../widgets/default_button.dart';

class FormSelecoesWorldCup extends StatefulWidget {
  const FormSelecoesWorldCup({super.key});

  @override
  State<FormSelecoesWorldCup> createState() => _FormSelecoesWorldCupState();
}

class _FormSelecoesWorldCupState extends State<FormSelecoesWorldCup> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final continenteController = TextEditingController();
  final corController = TextEditingController();
  final qtdTitulosController = TextEditingController();
  final imageLogoController = TextEditingController();

  late ApiService _apiService;

  @override
  void initState() {
    super.initState();

    _apiService = ApiService();
  }

  Future<void> saveSelecao() async {
    if (_formKey.currentState!.validate()) {
      final selecao = Selecoes(
        name: nameController.text,
        continente: continenteController.text,
        cores: corController.text,
        qtdTitulos: int.parse(qtdTitulosController.text),
        urlImage: imageLogoController.text,
      );
      await _apiService.addSelecao(selecao);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name to Pais: '),
          ),
          TextFormField(
            controller: continenteController,
            decoration: const InputDecoration(labelText: 'Continente: '),
          ),
          TextFormField(
            controller: qtdTitulosController,
            decoration: const InputDecoration(
              labelText: 'Quantidade de Títulos: ',
            ),
          ),
          TextFormField(
            controller: corController,
            decoration: const InputDecoration(labelText: 'Cores: '),
          ),
          TextFormField(
            controller: imageLogoController,
            decoration: const InputDecoration(labelText: 'Url Image: '),
          ),
          const SizedBox(
            height: 15,
          ),
          DefaultButton(
            onPressed: () {
              saveSelecao();
              setState(() {});
            },
            label: "Salvar Seleção",
          )
        ],
      ),
    );
  }
}
