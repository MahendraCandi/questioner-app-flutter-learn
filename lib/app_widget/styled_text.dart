import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    super.key,
    this.textSize = 12,
    this.fontWeight = FontWeight.normal,
    this.textStyle,
    this.textAlign,
    this.textColor = Colors.white,
  });

  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    var finalTextStyle = textStyle ?? const TextStyle();
    var finalTextAlign = textAlign ?? TextAlign.center;

    finalTextStyle = finalTextStyle.copyWith(
        fontSize: textSize, fontWeight: fontWeight, color: textColor,);

    return Text(
      text,
      style: finalTextStyle,
      textAlign: finalTextAlign,
    );
  }

}
