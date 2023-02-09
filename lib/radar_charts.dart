import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:radar_charts_app/home_page.dart';

class RadarChartsPage extends StatefulWidget {
  final int somme_A;
  final int somme_B;
  final int somme_C;
  final int somme_D;
  final int somme_E;
  final int somme_F;

  const RadarChartsPage({
    super.key,
    required this.somme_A,
    required this.somme_B,
    required this.somme_C,
    required this.somme_D,
    required this.somme_E,
    required this.somme_F,
  });

  @override
  State<RadarChartsPage> createState() => _RadarChartsPageState();
}

class _RadarChartsPageState extends State<RadarChartsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.somme_B.toDouble());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Votre Graphique"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (HomePage())),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadarWidget(
              skewing: 0,
              radarMap: RadarMapModel(
                legend: [
                  LegendModel('User', const Color(0XFFEAA035)),
                ],
                indicator: [
                  IndicatorModel("Protecteur", 10),
                  IndicatorModel("Critique", 10),
                  IndicatorModel("Raison", 10),
                  IndicatorModel("Libre", 10),
                  IndicatorModel("Soumis", 10),
                  IndicatorModel("Rebelle", 10)
                ],
                data: [
                  //   MapDataModel([48,32.04,1.00,94.5,19,60,50,30,19,60,50]),
                  //   MapDataModel([42.59,34.04,1.10,68,99,30,19,60,50,19,30]),
                  MapDataModel([
                    widget.somme_A.toDouble(),
                    widget.somme_B.toDouble(),
                    widget.somme_C.toDouble(),
                    widget.somme_D.toDouble(),
                    widget.somme_E.toDouble(),
                    widget.somme_F.toDouble()
                  ]),
                ],
                radius: 130,
                duration: 2000,
                shape: Shape.square,
                maxWidth: 70,
                line: LineModel(4),
              ),
              textStyle: const TextStyle(color: Colors.black, fontSize: 14),
              isNeedDrawLegend: true,
              lineText: (p, length) => "${(p * 100 ~/ length)}%",
              dilogText: (IndicatorModel indicatorModel,
                  List<LegendModel> legendModels, List<double> mapDataModels) {
                StringBuffer text = StringBuffer("");
                for (int i = 0; i < mapDataModels.length; i++) {
                  text.write(
                      "${legendModels[i].name} : ${mapDataModels[i].toString()}");
                  if (i != mapDataModels.length - 1) {
                    text.write("\n");
                  }
                }
                return text.toString();
              },
              outLineText: (data, max) => "${data * 100 ~/ max}%",
            ),
          ],
        ),
      ),
    );
  }
}
