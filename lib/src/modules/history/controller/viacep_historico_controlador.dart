import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_local_repositorio.dart';
import 'package:mobx/mobx.dart';

part 'viacep_historico_controlador.g.dart';

class ViaCepHistoricoControlador = _ViaCepHistoricoControlador with _$ViaCepHistoricoControlador;

abstract class _ViaCepHistoricoControlador with Store {
  final ViaCepLocalRepositorio viaCepLocalRepositorio;

  _ViaCepHistoricoControlador(this.viaCepLocalRepositorio);

  @observable
  ObservableList<ViaCepModel> viaCepLista = ObservableList<ViaCepModel>();

  @action
  Future<void> carregar() async {
    viaCepLista.clear();
    await viaCepLocalRepositorio.carregar();
    viaCepLista.addAll(viaCepLocalRepositorio.viaCepLista);
  }
}
