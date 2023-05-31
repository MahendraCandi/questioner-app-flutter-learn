import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questionair_app/app_widget/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 275,
          color: const Color.fromARGB(170, 255, 255, 255),
        ),
        // Opacity( // using opacity making lack performance
        //   opacity: 0.6,
        //   child: Image.asset(
        //     "assets/images/quiz-logo.png",
        //     width: 275,
        //   ),
        // ),
        const SizedBox(
          height: 75,
        ),
        StyledText(
          "Quiz Tebak-Tebakan!",
          textSize: 20,
          textStyle: GoogleFonts.lato(),
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(  height: 30,),
        OutlinedButton.icon(
          onPressed: switchScreen,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: const Icon(Icons.login),
          label: const StyledText("Start Quiz", textSize: 14),
        )
      ],
    );
  }
}
