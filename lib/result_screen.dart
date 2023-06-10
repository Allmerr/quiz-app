import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/list_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].qustion,
        'question_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summary = getSummary();
    var totalQuestions = summary.length;
    var totalCorrectAnswers = summary.where((sum) {
      return sum['question_answer'] == sum['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              '$totalCorrectAnswers from $totalQuestions Questions Answer Correctly!'),
          const SizedBox(
            height: 20,
          ),
          ListSummary(summary),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
