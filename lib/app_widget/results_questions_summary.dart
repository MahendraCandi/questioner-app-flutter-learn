import 'package:flutter/material.dart';
import 'package:questionair_app/app_widget/results_questions_detail_answer.dart';
import 'package:questionair_app/app_widget/results_questions_index_number.dart';

class ResultsQuestionsSummary extends StatelessWidget {
  const ResultsQuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var isAnswerCorrect = (data["user_answer"] == data["correct"]);

            return Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ResultsQuestionsIndexNumber(
                    indexNumber: data["question_index"] as int,
                    isAnswerCorrect: isAnswerCorrect,
                  ),
                  Expanded(
                    child: ResultsQuestionsDetailAnswer(data: data, isAnswerCorrect: isAnswerCorrect),
                  ),
                ]),
                const SizedBox(height: 10,)
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
