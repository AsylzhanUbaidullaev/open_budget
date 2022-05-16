import 'package:flutter/material.dart';

import '../shared/size_config.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  final TextAlign textAlign;
  final bool isUnderline;

  DefaultText({
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 24,
    this.color = Colors.black,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: getProportionateScreenHeight(fontSize),
        decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
