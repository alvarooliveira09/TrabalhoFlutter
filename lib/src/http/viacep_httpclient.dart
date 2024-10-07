import 'package:dio/dio.dart';

class ViaCepHttpClient {
  final Dio viaCepDio;

  ViaCepHttpClient() : viaCepDio = Dio() {
    viaCepDio.options.baseUrl = 'https://viacep.com.br/ws/';
  }
}
