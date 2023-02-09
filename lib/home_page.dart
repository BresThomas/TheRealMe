import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:radar_charts_app/quiz.dart';
import 'package:radar_charts_app/radar_charts.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Real Me',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff626267),
            ),
      ),
      home: const MyHomePage(title: 'Test Personnalité'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width * 0.9,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (RadarChartsPage(
                                somme_A: 0,
                                somme_B: 0,
                                somme_C: 0,
                                somme_D: 0,
                                somme_E: 0,
                                somme_F: 0))),
                      );
                    },
                    child: Text(
                      'Resultat du test',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton.icon(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  icon: Icon(Icons.arrow_back),
                  label: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      icon: Icon(Icons.arrow_back),
                      label: Text(
                        "Sign Out",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (QuizApp())),
                          );
                        },
                        child: Text(
                          'Faire le Quiz',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (RadarChartsPage(
                                    somme_A: 0,
                                    somme_B: 0,
                                    somme_C: 0,
                                    somme_D: 0,
                                    somme_E: 0,
                                    somme_F: 0))),
                          );
                        },
                        child: Text(
                          'Resultat du test',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        }));
  }
}
