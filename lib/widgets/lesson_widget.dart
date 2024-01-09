import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recreate_with_czar/models/lesson_card.dart';

class LessonWidget extends StatelessWidget {
  final LessonCardModel model;
  const LessonWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 155,
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            height: 141,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        model.backgroundImage ?? 'assets/lesson1.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 188,
                  child: Text(
                    model.subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 10,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: model.color,
                  ),
                  child: SvgPicture.asset('assets/play.svg')))
        ],
      ),
    );
  }
}
