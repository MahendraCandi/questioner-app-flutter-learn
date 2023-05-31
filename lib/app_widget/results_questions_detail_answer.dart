import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questionair_app/app_widget/styled_text.dart';

class ResultsQuestionsDetailAnswer extends StatelessWidget {
  final bool isAnswerCorrect;
  final Map<String, Object> data;

  const ResultsQuestionsDetailAnswer({super.key, required this.data, required this.isAnswerCorrect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledText(
          data["question"] as String,
          textAlign: TextAlign.left,
          textStyle: GoogleFonts.roboto(),
          textSize: 14,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 5,
        ),
        StyledText(
          data["correct"] as String,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.bold,
          textColor: isAnswerCorrect ? Colors.cyanAccent : Colors.amberAccent,
        ),
        StyledText(
          data["user_answer"] as String,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.bold,
          textColor: isAnswerCorrect ? Colors.cyanAccent : Colors.redAccent,
        ),
      ],
    );
  }
}
