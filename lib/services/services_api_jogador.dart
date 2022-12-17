import 'package:copa_app/models/jogador.dart';
import 'package:dio/dio.dart';

class JogadorApi {
  final Dio _dio = Dio();

  final baseUrl = 'http://localhost:3000/jogadores';

  Future<List<Jogador>> getSelecoes() async {
    Response response = await _dio.get(baseUrl);

    final jogadores =
        (response.data as List).map((item) => Jogador.fromJson(item));
    return jogadores.toList();
  }

  Future<Jogador?> addJogador(Jogador jogador) async {
    Jogador? newJogador;

    try {
      Response response = await _dio.post(baseUrl, data: jogador.toJson());

      if (response.statusCode == 200) {
        //ok
      }
    } catch (e) {
      print(e);
    }

    return newJogador;
  }

  Future<Jogador?> updateJogador(Jogador jogador) async {
    Jogador? jogadorAtt;

    try {
      Response response =
          await _dio.put("$baseUrl/${jogador.id}", data: jogador.toJson());

      jogadorAtt = Jogador.fromJson(response.data);
    } catch (e) {
      print(e);
    }

    return jogadorAtt;
  }

  Future<Jogador?> deleteJogador(int id) async {
    try {
      await _dio.delete("$baseUrl/$id");
    } catch (e) {
      print(e);
    }
  }
}
