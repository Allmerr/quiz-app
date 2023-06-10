import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/model/quiz_question.dart';
import 'package:adv_basics/widgets/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onChooseAnswer});

  final void Function(String answer) onChooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuizIndex = 0;

  void incrementQuizIndex(String answer) {
    widget.onChooseAnswer(answer);
    setState(() {
      currentQuizIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion quizQuestion = questions[currentQuizIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizQuestion.qustion,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...quizQuestion.getShuffledList().map((answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      incrementQuizIndex(answer);
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
