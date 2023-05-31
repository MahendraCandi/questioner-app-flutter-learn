import 'package:flutter/material.dart';
import 'package:questionair_app/app_widget/questions_screen.dart';
import 'package:questionair_app/app_widget/results_screen.dart';
import 'package:questionair_app/app_widget/start_screen.dart';
import 'package:questionair_app/repository/question_data.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz> {
  // *** change screen approach 1
  // *** by using injectable function
  // *** and using initState method
  //
  // Widget? activeScreen; // should be used question mark to tell this var can be null
  //
  // @override
  // void initState() { // something like post load on spring bean
  //   activeScreen = StartScreen(switchScreen); // pass the function to the constructor
  //   super.initState();
  // }
  //
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }

  // *** Change screen approach 2
  // *** Using condition (Something like enum on Java)
  var activeScreen = "start-screen";
  final String questionsScreen = "quiz-screen";
  final String resultScreen = "result-screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = questionsScreen;
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = resultScreen;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = questionsScreen;
    });

  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == questionsScreen) {
      screen = QuestionsScreen(onSelectAnswer: addAnswer);
    }

    if (activeScreen == resultScreen) {
      screen = ResultsScreen(chosenAnswer: selectedAnswers, onRestartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 175, 255, 126),
                Color.fromARGB(255, 0, 101, 25),
              ],
            ),
          ),
          child: Center(
            child: screen,
          ),
        ),
      ),
    );
  }
}
