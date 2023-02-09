import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radar_charts_app/radar_charts.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff626267),
            ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFF),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Quiz App'),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'On dit que j\'ai du sang froid',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'score': 5, 'category': 'C'},
      ],
    },
    {
      'questionText': 'j\'aime bien rire aux dépens des autres',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'Je me laisse influencer facilement',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'Je rends visite aux copains malades',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText': 'Je sais apprécier les imprévus',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'J\'admets très mal la tricherie',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'J\'aime beaucoup les voyages',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText':
          'Je remonte fréquemment le moral aux copains qui dépriment',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText':
          'Je n\'arrive pas en retard pour ne pas me faire remarquer',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'Je suis souvent en désaccord avec mon entourage',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'On me trouve logique et rationnel',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Il faut respecter les délais',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'Je ne contredis jamais un supérieur hiérarchique',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'J\'aide sans qu\'on me le demande',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText': 'Je sympathise assez souvent avec des inconnus',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'Les absences doivent être justifiées',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText':
          'Avant d\'effectuer un travail, je réfléchis sur la méthode à suivre',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Je suis râleur, contestataire',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'Je suis organisé dans mon travail',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Je repère facilement les défauts des autres',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'Je dis « oui » alors que je voulais dire « non »',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'Je prête facilement mes affaires',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText':
          'Quand quelqu\'un me plaît je n\'hésite pas à le lui dire',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'J\'apprécie la discipline',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'Quand je suis en colère, on m\'entend',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'Je porte souvent des appréciations sur les gens',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'Confronté à un échec, je réfléchis calmement',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Je préfère donner que recevoir',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText':
          'Dans une situation difficile je garde ma présence d\'esprit',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText':
          'Quand il convient d\'être en smoking, j\'ai tendance à mettre une chemise à fleurs',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'J\'accorde de l\'importance à ce qu\'on pense de moi',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText':
          'Je n\'aime pas partir dans l\'inconnu, il faut que ce soit planifié',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'J\'aime rassurer mon entourage',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText': 'J\'évite de prendre des responsabilités',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'J\'adore taquiner',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText':
          'J\'ai tendance à passer beaucoup de temps à aider les autres',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText':
          'Ce n\'est pas acceptable de doubler dans les files d\'attente',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'Je prévois les conséquences de mes actions',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Je choque souvent par mes propos',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'Je suis plutôt timide',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'On me trouve enthousiaste',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'Je remets mes opinions en question quand il le faut',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Quand je suis content ça se voit',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText':
          'Quand un problème se pose, j\'amasse le plus de données possibles pour le résoudre objectivement',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'J\'aime la satire et la dérision',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'J\'ai le souci de ne pas importuner les autres',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'Je ne cache pas mes émotions',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText':
          'Il est intolérable de faire claquer des pétards dans les cimetières',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'J\'ai l\'esprit de contradiction',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'Ça ne me déplairait pas d\'être médecin sans frontières',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText': 'Je me fais petit devant l\'autorité',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'Il est dommage que certaines valeurs, se perdent.',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'Avec moi on ne s\'ennuie pas',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'Dans le doute je sais me documenter',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'C'},
        {'text': 'Plutôt faux', 'category': 'C'},
      ],
    },
    {
      'questionText': 'Je suis réputé pour la férocité de mes remarques',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'F'},
        {'text': 'Plutôt faux', 'category': 'F'},
      ],
    },
    {
      'questionText': 'Dure est la loi, mais c\'est la loi',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'B'},
        {'text': 'Plutôt faux', 'category': 'B'},
      ],
    },
    {
      'questionText': 'On me dit que je suis « trop bon »',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
    {
      'questionText':
          'J\'essaie de ressembler à ce que mes parents voulaient que je fusse',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'E'},
        {'text': 'Plutôt faux', 'category': 'E'},
      ],
    },
    {
      'questionText': 'J\'ai toujours une histoire, drôle ou pas, à raconter',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'D'},
        {'text': 'Plutôt faux', 'category': 'D'},
      ],
    },
    {
      'questionText': 'J\'ai tendance à prendre les opprimés sous mon aile',
      'answers': [
        {'text': 'Plutôt vrai', 'category': 'A'},
        {'text': 'Plutôt faux', 'category': 'A'},
      ],
    },
  ];

  int somme_A = 0;
  int somme_B = 0;
  int somme_C = 0;
  int somme_D = 0;
  int somme_E = 0;
  int somme_F = 0;

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
    });
  }

  void _calculateSum(category, text) {
    if (category == 'A' && text == 'Plutôt vrai') {
      somme_A += 1;
    } else if (category == 'B' && text == 'Plutôt vrai') {
      somme_B += 1;
    } else if (category == 'C' && text == 'Plutôt vrai') {
      somme_C += 1;
    } else if (category == 'D' && text == 'Plutôt vrai') {
      somme_D += 1;
    } else if (category == 'E' && text == 'Plutôt vrai') {
      somme_E += 1;
    } else if (category == 'F' && text == 'Plutôt vrai') {
      somme_F += 1;
    }
  }

  void _answerQuestion() {
    setState(() {
      _currentQuestionIndex = _currentQuestionIndex + 1;
    });

    if (_currentQuestionIndex < _questions.length) {
      print('We have more questions!');
    } else {
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
                builder: (context) => RadarChartsPage(
                  somme_A: somme_A,
                  somme_B: somme_B,
                  somme_C: somme_C,
                  somme_D: somme_D,
                  somme_E: somme_E,
                  somme_F: somme_F,
                ),
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
                        children: answers.map((answer) {
                          final answerText = answer['text'];

                          return Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _answerQuestion();
                                  _calculateSum(answer['category'].toString(),
                                      answer['text'].toString());
                                },
                                child: Text(
                                  answerText.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
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
                                _answerQuestion();
                                _calculateSum(answer['category'].toString(),
                                    answer['text'].toString());
                              },
                              child: Text(
                                answerText.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
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
