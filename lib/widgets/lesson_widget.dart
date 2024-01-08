import 'package:flutter/material.dart';

class LessonWidget extends StatelessWidget {
  const LessonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(),
          Positioned(child: Container())
        ],
      ),
    );
  }
}