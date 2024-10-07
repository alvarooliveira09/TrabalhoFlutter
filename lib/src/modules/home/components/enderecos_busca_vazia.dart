import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';

Widget EnderecosBuscaVazia(){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          size: 75,
          color: CoresPersonalizadas.corVerde,
          Icons.directions,
        ),
        Text(
          'Faça uma busca para localizar\r\n seu destino',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CoresPersonalizadas.corPreto),
          textAlign: TextAlign.center,
        ),
      ]
  );
}