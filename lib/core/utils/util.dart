import 'package:flutter/material.dart';
import 'package:recreate_with_czar/core/shared/custom_route.dart';

SizedBox xSpace(double width) => SizedBox(
      width: width,
    );

SizedBox ySpace(double height) => SizedBox(
      height: height,
    );

void navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(OtherTransition(page));
}
