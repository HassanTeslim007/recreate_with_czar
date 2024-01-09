import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recreate_with_czar/models/home_card.dart';
import 'package:recreate_with_czar/pages/streak.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';
import 'package:recreate_with_czar/widgets/home_cards.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeCardModel> cards = [
    HomeCardModel(
        image: 'assets/home/reading.png', progress: 50, title: 'Reading'),
    HomeCardModel(
        image: 'assets/home/listening.png', progress: 50, title: 'Listening'),
    HomeCardModel(
        image: 'assets/home/writing.png', progress: 70, title: 'Writing'),
    HomeCardModel(
        image: 'assets/home/speaking.png', progress: 25, title: 'Speaking'),
    HomeCardModel(image: 'assets/home/books.png', progress: 80, title: 'Books'),
    HomeCardModel(
        image: 'assets/home/quizzes.png', progress: 40, title: 'Quizzes'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildheaderRow(),
          ySpace(40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your \nLearning Sphere',
                style: TextStyle(
                    color: primaryBrown,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset('assets/browse.svg'))
            ],
          ),
          ySpace(40),
          Flexible(
            fit: FlexFit.loose,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [...cards.map((e) => HomeCard(model: e))],
            ),
          )
        ],
      ),
    )));
  }

  _buildheaderRow() {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Row(
                    children: [
                      Text(
                        '🇬🇧',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.expand_more)
                    ],
                  ),
                  xSpace(40),
                  InkWell(
                    onTap: (){
                      navigateTo(context, const StreakPage());
                    },
                    child: const Text(
                      '🔥 2',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  xSpace(40),
                  const Text(
                    '🎯 17',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Stack(
                children: [
                  const Icon(Icons.notifications_outlined),
                  Positioned(
                    right: 2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
        xSpace(10),
        const CircleAvatar()
      ],
    );
  }

}
