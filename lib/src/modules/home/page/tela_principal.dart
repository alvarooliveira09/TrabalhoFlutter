import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/shared/components/historico_pesquisas_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_web_repositorio.dart';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:desafio_fastlocation/src/modules/home/repositories/viacep_local_repositorio.dart';
import 'package:desafio_fastlocation/src/http/viacep_httpclient.dart';
import 'package:desafio_fastlocation/src/shared/storage/viacep_armazenamento.dart';
import 'package:desafio_fastlocation/src/modules/home/controller/viacep_home_controlador.dart';
import 'package:desafio_fastlocation/src/routes/rotas.dart';
import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:desafio_fastlocation/src/modules/home/components/enderecos_lista.dart';
import 'package:desafio_fastlocation/src/modules/home/components/buscar_cep.dart';
import 'package:hive/hive.dart';
import 'package:desafio_fastlocation/src/modules/home/service/viacep_servico.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late final ViaCepHomeControlador viaCepHomeControlador;
  ViaCepModel? viaCep;
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    final Box<String> viaCepHiveBox = Hive.box<String>('cep');
    final viaCepArmazenamento = ViaCepArmazenamento(viaCepHiveBox);
    final viaCepServico = ViaCepServico(ViaCepHttpClient());

    final viaCepWebRepositorio = ViaCepWebRepositorio(viaCepServico);
    final viaCepLocalRepositorio = ViaCepLocalRepositorio(viaCepArmazenamento);

    viaCepHomeControlador = ViaCepHomeControlador(viaCepWebRepositorio, viaCepLocalRepositorio);
    viaCepHomeControlador.carregar();
  }

  Future<void> _localizarEndereco() async {
    final viaCepEncontrado = await BuscarCep.show(context, viaCepHomeControlador);
    if (viaCepEncontrado != null) {
      setState(() {
        carregando = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        viaCep = viaCepEncontrado;
        carregando = false;
      });
    }
  }

  Future<void> _abrirGoogleMaps(BuildContext context) async {
    if (viaCep != null) {
      setState(() {
        carregando = true;
      });
      await Future.delayed(Duration(milliseconds: 1000));
      await viaCepHomeControlador.abrirGoogleMaps(viaCep!);
      setState(() {
        carregando = false;
      });
    } else {
      setState(() {
        carregando = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            title: Text("Atenção:"),
            content: Text('Por favor, localize um endereço.',
              style: TextStyle(color: CoresPersonalizadas.corPreto, fontSize: 15),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () { Navigator.of(context).pop(); },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25.0),
        child: AppBar(
          backgroundColor: CoresPersonalizadas.corCinzaEscuro,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: CoresPersonalizadas.corCinzaClaro),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        size: 32,
                        color: CoresPersonalizadas.corVerde,
                        Icons.multiple_stop,
                      ),
                      Text(' Fast Location',
                        style: TextStyle(
                            color: CoresPersonalizadas.corVerde,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) {
                    return EnderecosListaWidget(
                      cep: viaCep?.cep,
                      logradouro: viaCep?.logradouro,
                      complemento: viaCep?.complemento,
                      bairro: viaCep?.bairro,
                      localidade: viaCep?.localidade,
                      uf: viaCep?.uf,
                      regiao: viaCep?.regiao,
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CoresPersonalizadas.corVerde,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: _localizarEndereco,
                  child: Text('Localizar endereço', style: TextStyle(color: CoresPersonalizadas.corBranco),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        size: 20,
                        color: CoresPersonalizadas.corVerde,
                        Icons.location_pin,
                      ),
                      Text(' Últimos endereços localizados',
                        style: TextStyle(
                          color: CoresPersonalizadas.corVerde,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => HistoricoPesquisasWidget(
                      history: viaCepHomeControlador.cepLocalRepository.viaCepLista),
                ),
                Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CoresPersonalizadas.corVerde,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () => { Navigator.pushNamed(context, Rotas.history) },
                    child: Text('Histórico de endereços',
                        style: TextStyle(color: CoresPersonalizadas.corBranco))
                  )
                )
              ],
            ),
          ),
          if (carregando)
            Container(
              color: CoresPersonalizadas.corBranco.withOpacity(0.8),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(CoresPersonalizadas.corVerde),
                ),
              ),
            ),
        ],
      ),

      bottomNavigationBar: SizedBox(
        height: 50.0,
        child:
        Container(
          decoration: BoxDecoration(color: CoresPersonalizadas.corBranco),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: CoresPersonalizadas.corVerde,
        onPressed: () => { _abrirGoogleMaps(context) },
        child: const Icon(Icons.fork_right, color: CoresPersonalizadas.corBranco, size: 45),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}