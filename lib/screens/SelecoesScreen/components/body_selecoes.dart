import 'package:copa_app/models/selecoes.dart';
import 'package:copa_app/services/service_api.dart';
import 'package:flutter/material.dart';

class BodySelecoes extends StatefulWidget {
  const BodySelecoes({super.key});

  @override
  State<BodySelecoes> createState() => _BodySelecoesState();
}

class _BodySelecoesState extends State<BodySelecoes> {
  late ApiService _apiService;

  @override
  void initState() {
    super.initState();

    _apiService = ApiService();
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
              return ListTile(
                title: Text("${selecoes.name} - ${selecoes.continente} "),
                subtitle: Text(selecoes.cores),
                leading: Text("${selecoes.qtdTitulos}"),
              );
            },
          );
        },
      ),
    );
  }
}
