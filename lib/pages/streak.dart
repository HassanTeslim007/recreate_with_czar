import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/size_config.dart';
import 'package:recreate_with_czar/utils/util.dart';
import 'package:recreate_with_czar/widgets/custom_button.dart';

class StreakPage extends StatefulWidget {
  const StreakPage({super.key});

  @override
  State<StreakPage> createState() => _StreakPageState();
}

class _StreakPageState extends State<StreakPage> {
  List<(String, bool)> streak = [
    ('Mon', true),
    ('Tue,', true),
    ('Wed', false),
    ('Thu', false),
    ('Fri', false),
    ('Sat', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          Stack(
            children: [
              Text(
                '2',
                style: TextStyle(
                    color: primaryBrown,
                    fontSize: SizeConfig.fontSize(context, 30)),
              ),
              SvgPicture.asset('assets/streak_off.svg'),
            ],
          ),
          Text(
            'days streak! 🔥',
            style: TextStyle(
                color: primaryBrown, fontSize: SizeConfig.fontSize(context, 4)),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 11),
            decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...streak
                        .map((e) => Column(
                              children: [
                                Text(
                                  e.$1,
                                  style: TextStyle(
                                      color: primaryBrown, fontSize: 20),
                                ),
                                e.$2
                                    ? SvgPicture.asset('assets/streak_on.svg')
                                    : SvgPicture.asset('assets/streak_off.svg')
                              ],
                            ))
                        .toList()
                  ],
                ),
                ySpace(25),
                const Text(
                  'You’re on a roll, great job! Practice each day to\n keep up with your streak and earn XP points.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  width: double.maxFinite,
                  height: 56,
                  child: CustomButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              ySpace(10),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  width: double.maxFinite,
                  height: 56,
                  child: CustomButton(
                    text: 'Share',
                    bgColor: scaffoldBgColor,
                    textColor: primaryBrown,
                    onPressed: () {},
                  )),
            ],
          )
        ],
      )),
    );
  }
}
