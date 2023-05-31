import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questionair_app/app_widget/answer_button.dart';
import 'package:questionair_app/app_widget/styled_text.dart';
import 'package:questionair_app/repository/question_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions.elementAt(currentQuestionIndex);

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyledText(
            currentQuestion.question,
            textSize: 24,
            fontWeight: FontWeight.bold,
            textStyle: GoogleFonts.roboto(),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.shuffledAnswer.map((answer) { // ... the three point dots is a spread. it's like flatMap on Java. fetch each object/field inside a list.
            return Container(
              margin: const EdgeInsets.only(bottom: 1),
              child: AnswerButton(
                  text: answer,
                  onTap: () => answerQuestion(answer)),
            );
          }),
        ],
      ),
    );
  }

}
