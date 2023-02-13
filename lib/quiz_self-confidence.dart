import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radar_charts_app/home_page.dart';
import 'package:radar_charts_app/radar_charts.dart';
import 'package:radar_charts_app/result_self-confident.dart';
import 'package:radar_charts_app/theme.dart';

class QuizApp_selfConfident extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Quiz App'),
        ),
        body: SelfConfident(),
      ),
    );
  }
}

class SelfConfident extends StatefulWidget {
  @override
  _SelfConfidentPageState createState() => _SelfConfidentPageState();
}

class _SelfConfidentPageState extends State<SelfConfident> {
  int _currentQuestionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'Je suis souvent capable de faire face à des défis difficiles sans abandonner.',
      'answers': [
        {'text': 'Toujours'},
        {'text': 'Souvent'},
        {'text': 'Rarement'},
        {'text': 'Jamais'},
      ],
    },
    {
      'questionText':
          'Je suis souvent capable de trouver des solutions à mes problèmes sans demander l\'aide d\'autres personnes.',
      'answers': [
        {'text': 'Toujours'},
        {'text': 'Souvent'},
        {'text': 'Rarement'},
        {'text': 'Jamais'},
      ],
    },
    {
      'questionText':
          'Je suis souvent capable de faire confiance à mes compétences pour accomplir une tâche difficile.',
      'answers': [
        {'text': 'Toujours'},
        {'text': 'Souvent'},
        {'text': 'Rarement'},
        {'text': 'Jamais'},
      ],
    },
    {
      'questionText':
          'Je suis souvent capable de persévérer face à des échecs ou des déceptions.',
      'answers': [
        {'text': 'Toujours'},
        {'text': 'Souvent'},
        {'text': 'Rarement'},
        {'text': 'Jamais'},
      ],
    },
    {
      'questionText':
          'Je suis souvent capable de me remettre rapidement d\'un échec et de continuer à poursuivre mes objectifs.',
      'answers': [
        {'text': 'Toujours'},
        {'text': 'Souvent'},
        {'text': 'Rarement'},
        {'text': 'Jamais'},
      ],
    },
  ];

  int somme_selfConfident = 0;

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
    });
  }

  void _calculateSum(text) {
    if (text == 'Toujours') {
      somme_selfConfident += 3;
    } else if (text == 'Souvent') {
      somme_selfConfident += 2;
    } else if (text == 'Rarement') {
      somme_selfConfident += 1;
    } else if (text == 'Jamais') {
      somme_selfConfident += 0;
    }
  }

  void _answerQuestion() {
    setState(() {
      _currentQuestionIndex = _currentQuestionIndex + 1;
    });

    if (_currentQuestionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      var user = FirebaseAuth.instance.currentUser;
      int result = somme_selfConfident;

      FirebaseDatabase.instance
          .ref()
          .child("users")
          .child(user!.uid)
          .child("result_selfConfident")
          .set(result);

      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= _questions.length) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPageSelfConfident(),
              ),
            );
          },
          child: Text('Votre graphique'),
        ),
      );
    }

    final question = _questions[_currentQuestionIndex];
    final questionText = question['questionText'];
    final answers = question['answers'] as List<Map<String, Object>>;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 250,
                child: questionText != null
                    ? Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                questionText.toString(),
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Text("No question"),
              ),
              SizedBox(
                height: 50,
              ),
              ...(answers != null
                  ? [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: answers.take(2).map((answer) {
                          final answerText = answer['text'];
                          return Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _calculateSum(answerText);
                                  _answerQuestion();
                                },
                                child: Text(
                                  answerText.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: answers
                            .skip(answers.length - 2)
                            .take(2)
                            .map((answer) {
                          final answerText = answer['text'];
                          return Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _calculateSum(answerText);
                                  _answerQuestion();
                                },
                                child: Text(
                                  answerText.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ]
                  : []),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 250,
                  child: questionText != null
                      ? Column(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  questionText.toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text("No question"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ...(answers != null
                  ? answers.map((answer) {
                      final answerText = answer['text'];

                      return Center(
                        child: Container(
                          height: 75,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculateSum(answerText);
                                _answerQuestion();
                              },
                              child: Text(
                                answerText.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  : []),
            ],
          );
        }
      },
    );
  }
}
