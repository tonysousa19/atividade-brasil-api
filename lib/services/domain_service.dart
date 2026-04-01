import 'package:consultaapi/models/domain_model.dart';
import 'package:dio/dio.dart';

class DomainService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://brasilapi.com.br/api"));

  Future<DomainModel> fetchDomainInfo(String domain) async {
    try {
      final response = await _dio.get('/registrobr/v1/$domain');
      return DomainModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw "Domínio não encontrado ou erro na API.";
      }
      throw "Falha ao conectar com o servidor.";
    }
  }
}