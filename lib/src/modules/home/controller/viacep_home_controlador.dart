import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_web_repositorio.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_local_repositorio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mobx/mobx.dart';

part 'viacep_home_controlador.g.dart';

class ViaCepHomeControlador = _ViaCepHomeControlador with _$ViaCepHomeControlador;

abstract class _ViaCepHomeControlador with Store {
  final ViaCepWebRepositorio cepRepository;
  final ViaCepLocalRepositorio cepLocalRepository;

  _ViaCepHomeControlador(this.cepRepository, this.cepLocalRepository);

  @observable
  ObservableList<ViaCepModel> viaCepLista = ObservableList<ViaCepModel>();

  @action
  Future<void> carregar() async {
    await cepLocalRepository.carregar();
    viaCepLista.clear();
    viaCepLista.addAll(cepLocalRepository.viaCepLista);
  }

  @action
  Future<void> salvar(ViaCepModel cep) async {
    await cepLocalRepository.salvar(cep);
    viaCepLista.add(cep);
  }

  Future<void> abrirGoogleMaps(ViaCepModel viaCep) async {
    String address = '${viaCep.logradouro}, ${viaCep.localidade}, ${viaCep.uf}';
    List<Location> locations = await locationFromAddress(address);

    final installedMaps = await MapLauncher.installedMaps;

    final mapa = installedMaps.firstWhere(
          (map) => map.mapName.toLowerCase() == "google maps",
      orElse: () => throw Exception('Verifique sua conexão com a internet.'),
    );

    await mapa.showMarker(
      coords: Coords(locations.first.latitude, locations.first.longitude),
      title: "CEP: ${viaCep.cep}",
    );
  }
}
