import 'package:flutter/material.dart';
import 'package:questionair_app/app_widget/styled_text.dart';

class ResultsQuestionsIndexNumber extends StatelessWidget {
  const ResultsQuestionsIndexNumber({super.key, required this.indexNumber, required this.isAnswerCorrect});

  final int indexNumber;
  final bool isAnswerCorrect;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = isAnswerCorrect ? Colors.greenAccent : Colors.deepOrange;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: StyledText(
        (indexNumber + 1).toString(),
        fontWeight: FontWeight.bold,
        textSize: 14,
      ),
    );
  }
}
