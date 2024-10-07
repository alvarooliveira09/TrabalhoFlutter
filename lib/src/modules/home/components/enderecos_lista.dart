import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/shared/metrics/espacamentos_padrao.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:desafio_fastlocation/src/modules/home/components/enderecos_busca_vazia.dart';
import 'package:desafio_fastlocation/src/modules/home/components/enderecos_ultimo.dart';

class EnderecosListaWidget extends StatelessWidget {

  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? regiao;

  const EnderecosListaWidget({
    Key? key,
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.regiao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: espacamentos_padrao.enderecos_widget_altura,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 20,
            color: CoresPersonalizadas.corCinzaMedio,
          ),
          color: CoresPersonalizadas.corCinzaMedio,
        ),
        child: Center(
          child: cep != null
              ? EnderecosUltimo(this)
              : EnderecosBuscaVazia(),
        ),
      ),
    );
  }
}
