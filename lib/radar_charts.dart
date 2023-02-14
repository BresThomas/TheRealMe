import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:radar_charts_app/home_page.dart';
import 'package:radar_charts_app/theme.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class RadarChartsPage extends StatefulWidget {
  @override
  State<RadarChartsPage> createState() => _RadarChartsPageState();
}

class _RadarChartsPageState extends State<RadarChartsPage> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<List<int>> _fetchData() async {
    User? currentUser = await FirebaseAuth.instance.currentUser;
    List<int> somme = [0, 0, 0, 0, 0, 0];
    if (currentUser != null) {
      String uid = currentUser.uid;

      final snapshot = await FirebaseDatabase.instance
          .ref()
          .child('users/$uid/result')
          .get();
      if (snapshot.exists) {
        List<int> somme =
            (snapshot.value as List<dynamic>).map((e) => e as int).toList();

        return somme;
      } else {
        print('No data available.');
        return somme;
      }
    } else {
      return somme;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<int>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<int> data = snapshot.data as List<int>;
            int somme_A = data[0];
            int somme_B = data[1];
            int somme_C = data[2];
            int somme_D = data[3];
            int somme_E = data[4];
            int somme_F = data[5];

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RadarWidget(
                    skewing: 0,
                    radarMap: RadarMapModel(
                      legend: [
                        LegendModel(
                          FirebaseAuth.instance.currentUser?.email as String,
                          CustomThemes.primaryColor,
                        ),
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
                        MapDataModel([
                          somme_A.toDouble(),
                          somme_B.toDouble(),
                          somme_C.toDouble(),
                          somme_D.toDouble(),
                          somme_E.toDouble(),
                          somme_F.toDouble(),
                        ]),
                      ],
                      radius: 130,
                      duration: 2000,
                      shape: Shape.square,
                      maxWidth: 70,
                      line: LineModel(4),
                    ),
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    isNeedDrawLegend: true,
                    lineText: (p, length) => "${(p * 100 ~/ length)}%",
                    dilogText: (IndicatorModel indicatorModel,
                        List<LegendModel> legendModels,
                        List<double> mapDataModels) {
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
            );
          } else if (snapshot.hasError) {
            return Text(
                "Erreur lors de la récupération des données : ${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
