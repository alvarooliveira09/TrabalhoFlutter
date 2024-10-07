import 'package:desafio_fastlocation/src/modules/history/page/tela_historico.dart';
import 'package:desafio_fastlocation/src/modules/home/page/tela_principal.dart';
import 'package:desafio_fastlocation/src/routes/rotas.dart';
import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/modules/initial/page/tela_inicializacao.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('cep');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          Rotas.home: (context) => TelaPrincipal(),
          Rotas.history: (context) => TelaHistorico(),
          Rotas.splash: (context) => TelaInicializacao(),
        },
        debugShowCheckedModeBanner: false,
        home: TelaInicializacao()
    );
  }

}
