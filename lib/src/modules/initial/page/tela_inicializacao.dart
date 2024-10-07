import 'dart:async';
import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/modules/home/page/tela_principal.dart';

// # Design your own SplashScreen
//https://medium.com/kick-start-fluttering/flutter-design-your-own-splashscreen-d0612b17db23

// # Rotate icon 180 degree with animation in flutter
//https://stackoverflow.com/a/68176041

class TelaInicializacao extends StatefulWidget {
  @override
  _TelaInicializacaoState createState() => _TelaInicializacaoState();
}

class _TelaInicializacaoState extends State<TelaInicializacao> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => TelaPrincipal()))
    );
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this
    )..repeat(reverse: true);
    _animation =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller, curve: Curves.elasticIn));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresPersonalizadas.corCinzaClaro,
      body: SafeArea(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Column(
                      children: [
                        RotationTransition(
                            turns: _animation,
                            child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                    size: 75, color: CoresPersonalizadas.corVerde, Icons.directions
                                ))),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 32, color: CoresPersonalizadas.corVerde, Icons.multiple_stop,
                              ),
                              Text(' Fast Location',
                                  style: TextStyle(
                                      color: CoresPersonalizadas.corVerde,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic
                                  )
                              )]
                        ),
                      ]
                  )
              ),
            ],
          )
      ),
    );
  }
}

