import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
    required this.chosenAnswers,
    required this.restartQuizButton
  });

  List<String> chosenAnswers;
  void Function() restartQuizButton;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'question': questions[i].text,
        'user_option': chosenAnswers[i],
        'correct_option': questions[i].options[0]
      });
    }
    return summary;
  }

  int getScore() {
    var score = 0;
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].options[0]) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final a = summaryData.where((data) {
      return data['user_option'] == data['correct_option'];
    }).length;
    final b = chosenAnswers.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $a out of $b questions correctly !",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              label: Text(
                "Restart Quiz",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 15
                ),
              ),
              onPressed: restartQuizButton,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
