import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';



class BuscarCepErro extends StatelessWidget {
  const BuscarCepErro({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      title: Text('Atenção:'),
      content: Text('Por favor, insira um CEP válido.',
        style: TextStyle(color: CoresPersonalizadas.corPreto, fontSize: 15),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fechar'),
        ),
      ],
    );
  }
}
