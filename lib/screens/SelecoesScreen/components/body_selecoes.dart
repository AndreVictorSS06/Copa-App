// ignore_for_file: use_build_context_synchronously

import 'package:copa_app/models/selecoes.dart';
import 'package:copa_app/services/service_api.dart';
import 'package:copa_app/services/services_api_jogador.dart';
import 'package:flutter/material.dart';

import 'item_selecao.dart';

class BodySelecoes extends StatefulWidget {
  const BodySelecoes({super.key});

  @override
  State<BodySelecoes> createState() => _BodySelecoesState();
}

class _BodySelecoesState extends State<BodySelecoes> {
  late ApiService _apiService;
  late Selecoes _selecao;

  var isEditing = false;

  final nameController = TextEditingController();
  final continenteController = TextEditingController();
  final corController = TextEditingController();
  final qtdTitulosController = TextEditingController();
  final imageLogoController = TextEditingController();

  Future<void> _updateSelecao(Selecoes selecao) async {
    _selecao.name = nameController.text;
    _selecao.continente = continenteController.text;
    _selecao.cores = corController.text;
    _selecao.qtdTitulos = int.parse(qtdTitulosController.text);
    _selecao.urlImage = imageLogoController.text;

    await _apiService.updateSelecao(_selecao);
  }

  Future<void> _removeSelecao(Selecoes selecao) async {
    await _apiService.deleteSelecao(selecao.id!);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        elevation: 5,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        content: Text('Seleção Removida!'),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _apiService = ApiService();
  }

  _populateForm(Selecoes selecao) {
    isEditing = true;
    _selecao = selecao;
    nameController.text = _selecao.name;
    continenteController.text = _selecao.continente;
    imageLogoController.text = _selecao.urlImage;
    corController.text = _selecao.cores;
    imageLogoController.text = _selecao.urlImage;
    qtdTitulosController.text = _selecao.qtdTitulos.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: FutureBuilder<List<Selecoes>>(
        future: _apiService.getSelecoes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final selecoes = snapshot.data![index];

              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    elevation: 4,
                    context: context,
                    builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              _populateForm(selecoes);

                              Navigator.pushNamed(context, '/form_selecoes');
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/jogadores');
                            },
                            child: const Text('Ver Jogadores'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ItemSelecao(
                  selecoes: selecoes,
                  onDismissed: _removeSelecao,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
