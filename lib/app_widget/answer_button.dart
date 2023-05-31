import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const AnswerButton({
    required this.text,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          backgroundColor: const Color.fromARGB(255, 0, 147, 45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        child: Text(text, textAlign: TextAlign.center,));
  }
}
