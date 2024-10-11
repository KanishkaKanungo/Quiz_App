import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/home_page.dart';
import 'package:flutter_quiz_app/main.dart';
import 'package:flutter_quiz_app/questions_page.dart';
import 'package:flutter_quiz_app/result_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activePage = "home_page";
  List<String> chosenOptions = [];
  // Widget? activePage;
  // @override
  // void initState() {
  //   super.initState();
  //   activePage = HomePage(switchPage);
  // }

  // void switchPage() {
  //   setState(() {
  //     activePage = const QuestionsPage();
  //   });
  // }
  void switchPage() {
    setState(() {
      activePage = "question_page";
    });
  }

  void addAnswers(String answers) {
    chosenOptions.add(answers);
    if (chosenOptions.length == questions.length) {
      setState(() {
        //chosenOptions = [];
        activePage = "results_page";
        //correctOptions.clear();
      });
    }
  }

  void restartQuiz() {
    setState(() {
      chosenOptions = [];
      activePage = "home_page";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomePage(switchPage);

    if (activePage == "question_page") {
      screenWidget = QuestionsPage(addAnswers: addAnswers);
    }

    if (activePage == "results_page") {
      screenWidget = ResultPage(
        chosenAnswers: chosenOptions,
        restartQuizButton: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Color(0xFFE91E63)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft
                  )
                ),
            child: screenWidget),
      ),
    );
  }
}
