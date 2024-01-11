import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recreate_with_czar/core/utils/colors.dart';
import 'package:recreate_with_czar/core/utils/util.dart';
import 'package:recreate_with_czar/widgets/custom_button.dart';

class SpeakingLesson extends StatefulWidget {
  const SpeakingLesson({super.key});

  @override
  State<SpeakingLesson> createState() => _SpeakingLessonState();
}

class _SpeakingLessonState extends State<SpeakingLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Flexible(
                    child: LinearPercentIndicator(
                  lineHeight: 10,
                  barRadius: const Radius.circular(20),
                  percent: 0.6,
                  progressColor: primaryBrown,
                  backgroundColor: const Color(0xFF908989),
                )),
              ],
            ),
            ySpace(20),
            const Text(
              'Speak this Sentence',
              style: TextStyle(fontSize: 20, color: Color(0xFF908989)),
            ),
            ySpace(34),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryBrown,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.volume_up_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  ySpace(25),
                  Text(
                    'Bonjour, Buchi, enchante',
                    style: TextStyle(
                      color: borderColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(child: Image.asset('assets/speaking.png')),
            const Spacer(),
            Text(
              'Brilliant!',
              style: TextStyle(
                color: borderColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            ySpace(16),
            Text(
              'Meaning:',
              style: TextStyle(
                color: borderColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            ySpace(16),
            Text(
              'Hello, Buchi, nice to meet you.',
              style: TextStyle(
                color: borderColor,
                fontSize: 16,
              ),
            ),
            ySpace(40),
            const CustomButton(
              text: 'Continue',
              marginH: 0,
            )
          ],
        ),
      ),
    ));
  }
}
