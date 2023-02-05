import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:radar_charts_app/radar_charts.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Test Personnalité'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Question {
  String title;
  String subtitle;
  Question(this.title, this.subtitle);
}

List<Question> questions = [
  Question('Question 1', 'Texte de la question 1'),
  Question('Question 2', 'Texte de la question 2'),
  Question('Question 3', 'Texte de la question 3'),
];

class _MyHomePageState extends State<MyHomePage> {
  int compteur_A = 0;
  int compteur_B = 0;
  int compteur_C = 0;
  int compteur_D = 0;
  int compteur_E = 0;
  int compteur_F = 0;

  void add_to_A() {
    setState(() {
      compteur_A++;
      print(compteur_A);
    });
  }

  void add_to_B() {
    setState(() {
      compteur_B++;
      print(compteur_B);
    });
  }

  void add_to_C() {
    setState(() {
      compteur_C++;
      print(compteur_C);
    });
  }

  void add_to_D() {
    setState(() {
      compteur_D++;
      print(compteur_D);
    });
  }

  void add_to_E() {
    setState(() {
      compteur_E++;
      print(compteur_E);
    });
  }

  void add_to_F() {
    setState(() {
      compteur_F++;
      print(compteur_F);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Quiz",
                style: TextStyle(fontSize: 34),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Voici la question",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Material(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        onTap: () {
                          // Appeler la fonction correspondant à ce bouton
                          switch (index) {
                            case 0:
                              add_to_A();
                              break;
                            case 1:
                              add_to_B();
                              break;
                            case 2:
                              add_to_C();
                              break;
                            case 3:
                              add_to_D();
                              break;
                            case 4:
                              add_to_E();
                              break;
                            case 5:
                              add_to_F();
                              break;
                            default:
                              break;
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            questions[index].subtitle,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
