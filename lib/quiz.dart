import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10, 'category': 'A'},
        {'text': 'Red', 'score': 5, 'category': 'B'},
        {'text': 'Green', 'score': 3, 'category': 'C'},
        {'text': 'White', 'score': 1, 'category': 'D'},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3, 'category': 'A'},
        {'text': 'Snake', 'score': 11, 'category': 'B'},
        {'text': 'Elephant', 'score': 5, 'category': 'C'},
        {'text': 'Lion', 'score': 9, 'category': 'D'},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1, 'category': 'A'},
        {'text': 'Max', 'score': 1, 'category': 'B'},
        {'text': 'Max', 'score': 1, 'category': 'C'},
        {'text': 'Max', 'score': 1, 'category': 'D'},
      ],
    },
  ];

  int _totalScore = 0;

  int somme_A = 0;
  int somme_B = 0;
  int somme_C = 0;
  int somme_D = 0;
  int somme_E = 0;
  int somme_F = 0;

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _totalScore = 0;
    });
  }

  void _calculateSum(category) {
    if (category == 'A') {
      somme_A += 1;
      print(somme_A);
    } else if (category == 'B') {
      somme_B += 1;
      print(somme_B);
    } else if (category == 'C') {
      somme_C += 1;
      print(somme_C);
    } else if (category == 'D') {
      somme_D += 1;
      print(somme_D);
    } else if (category == 'E') {
      somme_E += 1;
    } else if (category == 'F') {
      somme_F += 1;
    }
  }

  void _answerQuestion(int score) {
    _totalScore += score;

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
      return Center(child: Text('Finished'));
    }

    final question = _questions[_currentQuestionIndex];
    final questionText = question['questionText'];
    final answers = question['answers'] as List<Map<String, Object>>;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: questionText != null
              ? Text(
                  questionText.toString(),
                  style: TextStyle(fontSize: 28),
                )
              : Container(),
        ),
        ...(answers != null
            ? answers.map((answer) {
                final answerText = answer['text'];

                return Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      _answerQuestion(int.parse(answer['score'].toString()));
                      _calculateSum(answer['category'].toString());
                    },
                    child: Text(answerText.toString()),
                  ),
                );
              }).toList()
            : []),
      ],
    );
  }
}
