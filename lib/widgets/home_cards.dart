import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:recreate_with_czar/models/home_card.dart';
import 'package:recreate_with_czar/pages/speaking_lesson.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';

class HomeCard extends StatelessWidget {
  final HomeCardModel model;
  const HomeCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.title == 'Speaking' ? () {
        navigateTo(context, const SpeakingLesson());
      } : () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        margin: const EdgeInsets.all(10),
        // width: size.width / 2 - 50,
        decoration: BoxDecoration(
          border: Border.all(color: primaryBrown),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                model.image,
              ),
            ),
            Text(
              model.title,
              style: TextStyle(
                  color: primaryBrown,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'You completed ${model.progress}%',
              style: const TextStyle(fontSize: 13, color: Color(0xFF908989)),
            ),
            LinearPercentIndicator(
              lineHeight: 10,
              barRadius: const Radius.circular(20),
              percent: model.progress / 100,
              progressColor: primaryBrown,
              backgroundColor: const Color(0xFF908989),
            )
          ],
        ),
      ),
    );
  }
}
