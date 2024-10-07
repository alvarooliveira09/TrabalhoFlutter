import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/modules/home/service/viacep_servico.dart';


class ViaCepWebRepositorio {
  final ViaCepServico viaCepServico;

  ViaCepWebRepositorio(this.viaCepServico);

  Future<ViaCepModel> buscar(String cep) {
    return viaCepServico.buscar(cep);
  }
}
