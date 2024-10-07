import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/modules/home/components/buscar_cep_erro.dart';
import 'package:desafio_fastlocation/src/modules/home/controller/viacep_home_controlador.dart';
import 'package:desafio_fastlocation/src/modules/home/service/viacep_servico.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:desafio_fastlocation/src/http/viacep_httpclient.dart';
import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_web_repositorio.dart';

class BuscarCep {

  static Future<ViaCepModel?> show(BuildContext context, ViaCepHomeControlador viaCepControlador) async {
    final TextEditingController textEditingController = TextEditingController();
    final viaCepWebRepositorio = ViaCepWebRepositorio(ViaCepServico(ViaCepHttpClient()));

    return showDialog<ViaCepModel?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Digite o CEP'),
                autofocus: true,
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CoresPersonalizadas.corVerde,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () async {
                  try {
                    ViaCepModel viaCep = await viaCepWebRepositorio.buscar(textEditingController.text);
                    if (viaCep.cep != null) {
                      await viaCepControlador.salvar(viaCep);
                      await viaCepControlador.carregar();
                      Navigator.of(context).pop(viaCep);
                    } else {
                      showDialog_BuscarCepErro(context);
                    }
                  } catch (e) {
                    showDialog_BuscarCepErro(context);
                  }
                },
                child: Text('Buscar', style: TextStyle(color: CoresPersonalizadas.corBranco),),
              ),
            ),
          ],
        );
      },
    );

  }

  static void showDialog_BuscarCepErro(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BuscarCepErro();
      },
    );
  }

}
