import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questionair_app/app_widget/results_questions_summary.dart';
import 'package:questionair_app/app_widget/styled_text.dart';
import 'package:questionair_app/repository/question_data.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswer;
  final void Function() onRestartQuiz;

  const ResultsScreen({super.key, required this.chosenAnswer, required this.onRestartQuiz});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct": questions[i].answers[0],
        "user_answer": chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final totalCorrectAnswer = summaryData.where(
            (data) => data["user_answer"] == data["correct"]).length;
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyledText(
            "Result quiz",
            textSize: 24,
            fontWeight: FontWeight.bold,
            textStyle: GoogleFonts.roboto(),
          ),
          const SizedBox(height: 15),
          StyledText(
            "You answered $totalCorrectAnswer of $totalQuestions questions correctly!",
            textSize: 16,
            fontWeight: FontWeight.bold,
            textStyle: GoogleFonts.roboto(),
          ),
          const SizedBox(height: 30),
          ResultsQuestionsSummary(summaryData: summaryData),
          const SizedBox(height: 30),
          // AnswerButton(
          //   text: "Restart quiz",
          //   onTap: onRestartQuiz,
          // ),
          ElevatedButton.icon(
            onPressed: onRestartQuiz,
            icon: const Icon(Icons.restart_alt),
            label: const Text("Restart Quiz"),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                backgroundColor: const Color.fromARGB(255, 0, 147, 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
          )
        ],
      ),
    );
  }
}
