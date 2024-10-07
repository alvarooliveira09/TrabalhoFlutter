import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/http/viacep_httpclient.dart';


class ViaCepServico {
  final ViaCepHttpClient viaCepHttpClient;

  ViaCepServico(this.viaCepHttpClient);

  Future<ViaCepModel> buscar(String cep) async {
    try {
      final response = await viaCepHttpClient.viaCepDio.get('$cep/json/');
      return ViaCepModel.fromMap(response.data);
    } catch (e) {
      return ViaCepModel(erro: true);
    }
  }
}
