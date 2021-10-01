import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:flutter/material.dart';

class ButtonWodget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  const ButtonWodget(
      {required this.label, required this.onPressed, this.style, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: style ?? AppStyles.buttonHeading,
          )),
    );
  }
}
