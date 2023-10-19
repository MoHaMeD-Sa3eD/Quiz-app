import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'main.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int QuestionIndex;
  final Function(int s) answerQuestion;

  Quiz(this.question, this.QuestionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question[QuestionIndex]['questionText'].toString()),
        ...(question[QuestionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'].toString(),
              () => answerQuestion(int.parse(answer['score'].toString())));
        }).toList(),
      ],
    );
  }
}
