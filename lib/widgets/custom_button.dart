import 'package:flutter/material.dart';
import 'package:recreate_with_czar/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CustomButton(
      {super.key,
      required this.text,
      this.bgColor,
      this.textColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? primaryBrown, elevation: 0),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 20),
        ));
  }
}
