import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String AnswerText;

  final Function answerQuestion;

  Answer(this.AnswerText, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => answerQuestion(),
        child: Text(
          AnswerText,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
