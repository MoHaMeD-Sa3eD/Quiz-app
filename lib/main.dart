import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'answer.dart';
import 'question.dart';
import 'result.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
//Color Theme :

Color w = Colors.white;
Color b = Colors.black;
bool isSwitched = false;

//------------------------------
class _MyAppState extends State<MyApp> {
  int _totalScore = 0;

  int _QuestionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _QuestionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _QuestionIndex += 1;
    });
    print('Answer has been chosen ! ');
    print(_QuestionIndex);
    print(_totalScore);
  }

  final List<Map<String, Object>> _Question = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'blue', 'score': 10},
        {'text': 'green', 'score': 20},
        {'text': 'black', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'elephant', 'score': 20},
        {'text': 'Dog', 'score': 30},
        {'text': 'Cat', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {'text': 'Sa3ed', 'score': 10},
        {'text': 'So3io', 'score': 20},
        {'text': 'Se3aa', 'score': 30},
        {'text': 'Abo sa3ed', 'score': 40},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
            style: TextStyle(color: w),
          ),
          actions: [
            Switch(
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.white,
              activeColor: Colors.green,
              activeTrackColor: Colors.white,
              value: isSwitched,
              onChanged: (bool Value) {
                setState(() {
                  isSwitched = Value;
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black;
                  } else {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
                print(isSwitched);
              },
            ),
          ],
        ),
        body: Container(
          color: w,
          child: _QuestionIndex < _Question.length
              ? Quiz(_Question, _QuestionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}
