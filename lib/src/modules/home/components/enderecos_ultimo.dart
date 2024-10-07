import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:desafio_fastlocation/src/modules/home/components/enderecos_lista.dart';


Widget EnderecosUltimo(EnderecosListaWidget end){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child:
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Dados da Localização',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CoresPersonalizadas.corVerde),
              textAlign: TextAlign.center),
        ),
      ),
      Text.rich(
        TextSpan(
            text: 'Logradouro/Rua: ',
            style: TextStyle(height: 2, fontSize: 14.0,
                fontWeight: FontWeight.bold, color: CoresPersonalizadas.corVerde),
            children: [
              TextSpan(
                  text: '${end.logradouro}',
                  style: TextStyle(fontWeight: FontWeight.normal, color: CoresPersonalizadas.corPreto)),
            ]),
      ),
      Text.rich(
        TextSpan(
            text: 'Bairro/Distrito: ',
            style: TextStyle(height: 1.8, fontSize: 14.0,
                fontWeight: FontWeight.bold, color: CoresPersonalizadas.corVerde),
            children: [
              TextSpan(
                  text: '${end.bairro}',
                  style: TextStyle(fontWeight: FontWeight.normal, color: CoresPersonalizadas.corPreto)),
            ]),
      ),
      if (end.complemento != null && end.complemento!.isNotEmpty)
        Text.rich(
          TextSpan(
              text: 'Complemento: ',
              style: TextStyle(height: 1.8, fontSize: 14.0,
                  fontWeight: FontWeight.bold, color: CoresPersonalizadas.corVerde),
              children: [
                TextSpan(
                    text: '${end.complemento}',
                    style: TextStyle(fontWeight: FontWeight.normal, color: CoresPersonalizadas.corPreto)),
              ]),
        ),
      Text.rich(
        TextSpan(
            text: 'Cidade/UF: ',
            style: TextStyle(height: 1.8, fontSize: 14.0,
                fontWeight: FontWeight.bold, color: CoresPersonalizadas.corVerde),
            children: [
              TextSpan(
                  text: '${end.localidade}/${end.uf} ',
                  style: TextStyle(fontWeight: FontWeight.normal, color: CoresPersonalizadas.corPreto)),
            ]),
      ),
      Text.rich(
        TextSpan(
            text: 'Região do Brasil: ',
            style: TextStyle(height: 1.8, fontSize: 14.0,
                fontWeight: FontWeight.bold, color: CoresPersonalizadas.corVerde),
            children: [
              TextSpan(
                  text: '${end.regiao}',
                  style: TextStyle(fontWeight: FontWeight.normal, color: CoresPersonalizadas.corPreto)),
            ]),
      ),
      Text.rich(
        TextSpan(
            text: 'CEP: ',
            style: TextStyle(height: 1.8, fontSize: 14.0,
                fontWeight: FontWeight.bold, color: CoresPersonalizadas.corVerde),
            children: [
              TextSpan(
                  text: '${end.cep}',
                  style: TextStyle(fontWeight: FontWeight.normal, color: CoresPersonalizadas.corPreto)),
            ]),
      ),
    ],
  );
}