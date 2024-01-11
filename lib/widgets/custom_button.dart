import 'package:flutter/material.dart';
import 'package:recreate_with_czar/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? marginH;
  const CustomButton(
      {super.key,
      required this.text,
      this.bgColor,
      this.textColor,
      this.onPressed,
      this.width,
      this.height,
      this.marginH});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginH ?? 22),
      width: width ?? double.maxFinite,
      height: height ?? 56,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: bgColor ?? primaryBrown,
              elevation: 0),
          onPressed: onPressed ?? () {},
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 20),
          )),
    );
  }
}
