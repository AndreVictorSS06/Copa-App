import 'package:copa_app/models/selecoes.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _client = Dio();
  final baseUrl = 'http://localhost:3000/selecoes';

  Future<List<Selecoes>> getSelecoes() async {
    Response response = await _client.get(baseUrl);

    final selecoes =
        (response.data as List).map((item) => Selecoes.fromJson(item));
    return selecoes.toList();
  }

  Future<Selecoes?> addSelecao(Selecoes selecao) async {
    Selecoes? newSelecao;

    try {
      Response response = await _client.post(baseUrl, data: selecao.toJson());

      if (response.statusCode == 200) {
        //ok
      }
    } catch (e) {
      print(e);
    }

    return newSelecao;
  }

  Future<Selecoes?> updateSelecao(Selecoes selecao) async {
    Selecoes? selecaoAtt;

    try {
      Response response =
          await _client.put("$baseUrl/${selecao.id}", data: selecao.toJson());

      selecaoAtt = Selecoes.fromJson(response.data);
    } catch (e) {
      print(e);
    }

    return selecaoAtt;
  }

  Future<Selecoes?> deleteSelecao(int id) async {
    try {
      await _client.delete("$baseUrl/$id");
    } catch (e) {
      print(e);
    }
  }
}
