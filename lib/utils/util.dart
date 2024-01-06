import 'package:flutter/material.dart';

SizedBox xSpace(double width) => SizedBox(width: width,);

SizedBox ySpace(double height) => SizedBox(height: height,);

void navigateTo(BuildContext context, Widget page){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}