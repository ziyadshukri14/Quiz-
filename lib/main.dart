import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite football club?',
      'answers': [
        {'text': 'Manchester United', 'score': 10},
        {'text': 'Barcelona', 'score': 5},
        {'text': 'Real Madrid', 'score': 3},
        {'text': 'Bayern Munich', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite football player?',
      'answers': [
        {'text': 'Cristiano Ronaldo', 'score': 3},
        {'text': 'Zinedine Zidane', 'score': 11},
        {'text': 'Lionel Messi', 'score': 5},
        {'text': 'Neymar', 'score': 9}
      ]
    },
    {
      'questionText': 'Whos is your favorite instructor?',
      'answers': [
        {'text': 'Dr Salmi', 'score': 1},
        {'text': 'Dr Erzam', 'score': 1},
        {'text': 'Dr Khaironi', 'score': 1},
        {'text': 'Dr Ng', 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
