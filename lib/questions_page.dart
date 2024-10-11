import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/options_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.addAnswers});

  final void Function(String answers) addAnswers;

  @override
  State<QuestionsPage> createState() {
    return _QuestionPage();
  }
}

class _QuestionPage extends State<QuestionsPage> {
  var currentQuestionIndex = 0;

  void currentIndexChange(String answer) {
    widget.addAnswers(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.red.shade50,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffleList().map((answers) {
              return OptionsButton(
                  onTap: () {
                    currentIndexChange(answers);
                  },
                  anstext: answers);
            })
            // OptionsButton(onTap: () {}, anstext: currentQuestion.options[0]),
            // OptionsButton(onTap: () {}, anstext: currentQuestion.options[1]),
            // OptionsButton(onTap: () {}, anstext: currentQuestion.options[2]),
            // OptionsButton(onTap: () {}, anstext: currentQuestion.options[3]),
          ],
        ),
      ),
    );
  }
}
