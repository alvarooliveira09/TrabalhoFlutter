import 'package:desafio_fastlocation/src/shared/colors/cores_personalizadas.dart';
import 'package:flutter/material.dart';
import 'package:desafio_fastlocation/src/modules/home/model/viacep_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HistoricoPesquisasWidget extends StatelessWidget {
  final ObservableList<ViaCepModel> history;

  const HistoricoPesquisasWidget({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: 150,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 20,
              color: history.length != 0 ? CoresPersonalizadas.corCinzaClaro : CoresPersonalizadas.corBranco,
            ),
            color: history.length != 0 ? CoresPersonalizadas.corCinzaClaro : CoresPersonalizadas.corBranco,
          ),
          child:
          history.length != 0
              ? ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[history.length - 1 - index];
              return _buildList(item);
            },
          )
              : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  size: 75,
                  color: CoresPersonalizadas.corVerde,
                  Icons.location_off,
                ),
                Text('Não há locais recentes',
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold, color: CoresPersonalizadas.corPreto),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
        );
      },
    );
  }

  Widget _buildList(ViaCepModel item) {
    return Container(
      child: Card(
          color: CoresPersonalizadas.corBranco,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 3.0),
          child:

          Table(
            // border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: FixedColumnWidth(64),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              //https://api.flutter.dev/flutter/widgets/Table-class.html#widgets.Table.1
              TableRow(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 40,
                    child: Icon(
                      size: 30,
                      color: CoresPersonalizadas.corCinzaEscuro,
                      Icons.signpost,
                    ),
                  ),
                  Container(
                    child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('${item.bairro}', textAlign: TextAlign.start,
                                  style: TextStyle(
                                            fontSize: 14,
                                            color: CoresPersonalizadas.corPreto,
                                            fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                              Expanded(
                                child: Text('${item.localidade}, ${item.uf}ㅤ', textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CoresPersonalizadas.corCinzaEscuro,
                                      fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('${item.logradouro}', textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: CoresPersonalizadas.corPreto
                                  )
                                ),
                              ),
                              Expanded(
                                child: Text('${item.cep}ㅤ', textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: CoresPersonalizadas.corPreto,
                                      fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )

      ),
    );
  }

}
