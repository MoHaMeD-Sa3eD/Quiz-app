import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function() ResetQuiz;
  final TotalScore;

  Result(this.ResetQuiz, this.TotalScore);

  String get resultPhrase {
    String resultText;
    if (TotalScore >= 70) {
      resultText = 'great';
    } else if (TotalScore >= 40) {
      resultText = 'good';
    } else {
      resultText = 'Too Bad';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your score is $TotalScore',
            style:  TextStyle(fontSize: 47, fontWeight: FontWeight.bold,color: b),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            resultPhrase.toString(),
            style:  TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: b),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () => ResetQuiz(),
              child: const Text(
                'Restart the Quiz',
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
