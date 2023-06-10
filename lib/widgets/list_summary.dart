import 'package:flutter/material.dart';

class ListSummary extends StatelessWidget {
  const ListSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((sum) {
            return Row(
              children: [
                Text(((sum['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(sum['question'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(sum['question_answer'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(sum['user_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
