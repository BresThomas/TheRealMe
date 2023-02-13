import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:radar_charts_app/theme.dart';

class ResultPageSelfConfident extends StatefulWidget {
  @override
  _ResultPageSelfConfidentState createState() =>
      _ResultPageSelfConfidentState();
}

class _ResultPageSelfConfidentState extends State<ResultPageSelfConfident> {
  late int result;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    User? currentUser = await FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String uid = currentUser.uid;
      final snapshot = await FirebaseDatabase.instance
          .ref()
          .child('users/$uid/result_selfConfident')
          .get();
      if (snapshot.exists) {
        setState(() {
          result = snapshot.value as int;
          _loading = false;
        });
      } else {
        print('No data available.');
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Result: $result',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: CustomThemes.primaryColor,
                    margin: EdgeInsets.symmetric(horizontal: 80.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Voici une explication en fonction du score :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Score de 12 à 15 : Vous avez une forte self-efficacité et êtes souvent capable de faire face à des défis avec confiance en vos compétences. Vous êtes capable de persévérer face à des échecs et de vous remettre rapidement d'un revers.",
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Score de 9 à 11 : Vous avez un niveau modéré de self-efficacité et êtes souvent capable de faire face à des défis, mais peut-être pas toujours avec confiance en vos compétences. Il est possible que vous ayez besoin de plus de soutien pour persévérer face à des échecs.",
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Score de 6 à 8 : Vous avez un faible niveau de self-efficacité et pouvez rencontrer des difficultés pour faire face à des défis et persévérer face à des échecs. Il est important de travailler sur votre confiance en vos compétences pour renforcer votre self-efficacité.",
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Score de 0 à 5 : Vous avez un très faible niveau de self-efficacité et pouvez rencontrer des difficultés pour faire face à des défis et pour persévérer face à des échecs. Il est important de travailler sur votre confiance en vous. Il peut être utile de rechercher l'aide d'un conseiller ou d'un thérapeute pour travailler sur votre confiance en vous. Il est également important de célébrer vos réalisations et de vous concentrer sur vos forces plutôt que sur vos faiblesses. En travaillant sur votre self-efficacité, vous pourrez vous sentir plus confiant et capable de faire face à des défis avec succès.",
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
