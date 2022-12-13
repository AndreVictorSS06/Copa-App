import 'package:copa_app/models/selecoes.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final baseUrl = 'http://localhost:3000/selecoes';

  Future<List<Selecoes>> getSelecoes() async {
    Response response = await _dio.get(baseUrl);

    final selecoes = (response.data as List).map((e) => Selecoes.fromJson(e));
    return selecoes.toList();
  }
}
