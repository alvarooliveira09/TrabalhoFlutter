// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viacep_home_controlador.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViaCepHomeControlador on _ViaCepHomeControlador, Store {
  late final _$viaCepListaAtom =
      Atom(name: '_ViaCepHomeControlador.viaCepLista', context: context);

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

  late final _$carregarAsyncAction =
      AsyncAction('_ViaCepHomeControlador.carregar', context: context);

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$salvarAsyncAction =
      AsyncAction('_ViaCepHomeControlador.salvar', context: context);

  @override
  Future<void> salvar(ViaCepModel cep) {
    return _$salvarAsyncAction.run(() => super.salvar(cep));
  }

  @override
  String toString() {
    return '''
viaCepLista: ${viaCepLista}
    ''';
  }
}
