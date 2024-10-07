import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'viacep_armazenamento.g.dart';

class ViaCepArmazenamento = _ViaCepArmazenamento with _$ViaCepArmazenamento;

abstract class _ViaCepArmazenamento with Store {
  final Box<String> hiveBox;

  _ViaCepArmazenamento(this.hiveBox);

  @observable
  ObservableList<ViaCepModel> viaCepLista = ObservableList<ViaCepModel>();

  @action
  Future<void> carregarViaCeps() async {
    viaCepLista.clear();
    final jsonString = hiveBox.get('jsonViaCepLista');
    if (jsonString != null) {
      final List<dynamic> jsonLista = jsonDecode(jsonString);
      viaCepLista.addAll(jsonLista.map((e) => ViaCepModel.fromMap(e)).toList());
    }
  }

  @action
  Future<void> saveCEP(ViaCepModel cep) async {
    viaCepLista.add(cep);
    await hiveBox.put('jsonViaCepLista', jsonEncode(viaCepLista.map((e) => e.toMap()).toList()));
  }
}
