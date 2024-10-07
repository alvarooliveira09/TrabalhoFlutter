// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viacep_armazenamento.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViaCepArmazenamento on _ViaCepArmazenamento, Store {
  late final _$viaCepListaAtom =
      Atom(name: '_ViaCepArmazenamento.viaCepLista', context: context);

  @override
  ObservableList<ViaCepModel> get viaCepLista {
    _$viaCepListaAtom.reportRead();
    return super.viaCepLista;
  }

  @override
  set viaCepLista(ObservableList<ViaCepModel> value) {
    _$viaCepListaAtom.reportWrite(value, super.viaCepLista, () {
      super.viaCepLista = value;
    });
  }

  late final _$carregarViaCepsAsyncAction =
      AsyncAction('_ViaCepArmazenamento.carregarViaCeps', context: context);

  @override
  Future<void> carregarViaCeps() {
    return _$carregarViaCepsAsyncAction.run(() => super.carregarViaCeps());
  }

  late final _$saveCEPAsyncAction =
      AsyncAction('_ViaCepArmazenamento.saveCEP', context: context);

  @override
  Future<void> saveCEP(ViaCepModel cep) {
    return _$saveCEPAsyncAction.run(() => super.saveCEP(cep));
  }

  @override
  String toString() {
    return '''
viaCepLista: ${viaCepLista}
    ''';
  }
}
