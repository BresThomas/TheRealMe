import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';

class MyAppCharts extends StatelessWidget {
  final int somme_A;
  final int somme_B;
  final int somme_C;
  final int somme_D;
  final int somme_E;
  final int somme_F;

  MyAppCharts({
    required this.somme_A,
    required this.somme_B,
    required this.somme_C,
    required this.somme_D,
    required this.somme_E,
    required this.somme_F,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Test Personnalité',
        somme_A: somme_A,
        somme_B: somme_B,
        somme_C: somme_C,
        somme_D: somme_D,
        somme_E: somme_E,
        somme_F: somme_F,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  final String title;
  final int somme_A;
  final int somme_B;
  final int somme_C;
  final int somme_D;
  final int somme_E;
  final int somme_F;

  const MyHomePage({
    super.key,
    required this.title,
    required this.somme_A,
    required this.somme_B,
    required this.somme_C,
    required this.somme_D,
    required this.somme_E,
    required this.somme_F,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.somme_C.toDouble());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadarWidget(
              skewing: 0,
              radarMap: RadarMapModel(
                legend: [
                  LegendModel('Valentin', const Color(0XFFEAA035)),
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
