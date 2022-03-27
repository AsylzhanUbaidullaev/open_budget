import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final Function()? onPress;

  CustomTextButton({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: AppColors.primaryColor, padding: EdgeInsets.zero),
      child: Text(
        text!,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
        ),
      ),
      onPressed: onPress,
    );
  }
}
