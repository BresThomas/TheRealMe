import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:radar_charts_app/breathing.dart';
import 'package:radar_charts_app/quiz_self-confidence.dart';
import 'package:radar_charts_app/radar_charts.dart';

import '../../quiz_personality.dart';

class home_screen_computer extends StatelessWidget {
  const home_screen_computer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (BreathingPage())),
                    );
                  },
                  child: Text(
                    'Respiration',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (QuizApp_selfConfident())),
                    );
                  },
                  child: Text(
                    'Faire le Quiz de confiance en soi',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (QuizApp())),
                  );
                },
                child: Text(
                  'Faire le Quiz',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (RadarChartsPage())),
                  );
                },
                child: Text(
                  'Resultat du test',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(Icons.arrow_back),
            label: Text(
              "Sign Out",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
