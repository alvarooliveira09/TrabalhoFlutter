import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:desafio_fastlocation/src/shared/components/historico_pesquisas_widget.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:desafio_fastlocation/src/shared/storage/viacep_armazenamento.dart';
import 'package:desafio_fastlocation/src/modules/history/controller/viacep_historico_controlador.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_local_repositorio.dart';


class TelaHistorico extends StatefulWidget {
  @override
  _TelaHistoricoState createState() => _TelaHistoricoState();
}

class _TelaHistoricoState extends State<TelaHistorico> {
  late final ViaCepHistoricoControlador viaCepHistoricoControlador;

  @override
  void initState() {
    super.initState();
    final Box<String> viaCepHiveBox = Hive.box<String>('cep');
    final viaCepArmazenamento = ViaCepArmazenamento(viaCepHiveBox);
    final viaCepLocalRepository = ViaCepLocalRepositorio(viaCepArmazenamento);
    viaCepHistoricoControlador = ViaCepHistoricoControlador(viaCepLocalRepository);
    viaCepHistoricoControlador.carregar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresPersonalizadas.corCinzaClaro,
        elevation: 0,
        title: Text('',
          style: TextStyle(color: CoresPersonalizadas.corVerde),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CoresPersonalizadas.corVerde),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: CoresPersonalizadas.corCinzaClaro),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  size: 32,
                  color: CoresPersonalizadas.corVerde,
                  Icons.share_location,
                ),
                Text(
                  ' Endereços localizados',
                  style: TextStyle(
                      color: CoresPersonalizadas.corVerde,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
            Expanded(
              child: Observer(
                builder: (_) => HistoricoPesquisasWidget(history: viaCepHistoricoControlador.viaCepLista),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
