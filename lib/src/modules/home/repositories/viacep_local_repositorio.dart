import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/shared/storage/viacep_armazenamento.dart';
import 'package:mobx/mobx.dart';

class ViaCepLocalRepositorio with Store {
  final ViaCepArmazenamento viaCepArmazenamento;

  ViaCepLocalRepositorio(this.viaCepArmazenamento);

  @observable
  ObservableList<ViaCepModel> viaCepLista = ObservableList<ViaCepModel>();

  @action
  Future<void> carregar() async {
    viaCepLista.clear();
    await viaCepArmazenamento.carregarViaCeps();
    viaCepLista.addAll(viaCepArmazenamento.viaCepLista);
  }

  @action
  Future<void> salvar(ViaCepModel cep) async {
    await viaCepArmazenamento.saveCEP(cep);
  }
}
