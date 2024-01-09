import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:recreate_with_czar/models/lesson_card.dart';
import 'package:recreate_with_czar/pages/streak.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';
import 'package:recreate_with_czar/widgets/lesson_widget.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  List<LessonCardModel> lessons = [
    LessonCardModel(
        color: Colors.orange,
        title: 'First Trip',
        subtitle:
            'Here you will listen to conversations between tourists, and learn to speak together with them!',
        backgroundImage: 'assets/lesson1.png'),
    LessonCardModel(
        color: Colors.grey,
        title: 'Freelance Work',
        subtitle:
            'After taking this classes, you will be able to take orders from foreigners! ',
        backgroundImage: 'assets/lesson2.png'),
    LessonCardModel(
        color: const Color(0xffCB9937),
        title: 'First Meeting',
        subtitle:
            'You will learn to communicate with your colleagues and understand them!',
        backgroundImage: 'assets/lesson3.png'),
    LessonCardModel(
        color: Colors.black,
        title: 'Meeting With Partners',
        subtitle:
            'You will learn to communicate with your colleagues and understand them!',
        backgroundImage: 'assets/lesson4.png'),
  ];
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 36),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _buildheaderRow(),
            ySpace(20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                // color: Colors.blue,
                child: ContainedTabBarView(
                  tabBarViewProperties: const TabBarViewProperties(),
                  tabBarProperties: TabBarProperties(
                    unselectedLabelColor: borderColor,
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: const EdgeInsets.all(6),
                    indicator: BoxDecoration(
                        color: primaryBrown,
                        border: Border.all(color: borderColor.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(50)),
                    background: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: borderColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  tabs: const [
                    Text('Audio Lesson'),
                    Text('Video Lesson'),
                  ],
                  views: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ListView.builder(
                          itemCount: lessons.length,
                          itemBuilder: (context, index) =>
                              LessonWidget(model: lessons[index])),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ListView.builder(
                          itemCount: lessons.length,
                          itemBuilder: (context, index) =>
                              LessonWidget(model: lessons[index])),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _buildheaderRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10)),
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
              xSpace(20),
              InkWell(
                onTap: () => navigateTo(context, const StreakPage()),
                child: const Text(
                  '🔥 2',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              xSpace(20),
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
    );
  }
}

  // DefaultTabController(
  //             length: 2,
  //             child: Column(
  //               children: [
  //                 Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: borderColor.withOpacity(0.5)),
                    //     borderRadius: BorderRadius.circular(50)),
  //                   child: TabBar(
  //                       labelColor: Colors.red,
  //                       indicator: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(30),
  //                           border: Border.all(color: borderColor)),
  //                       tabs: const [
  //                         Tab(
  //                           text: 'Audio Lesson',
  //                         ),
  //                         Tab(
  //                           text: 'Video Lesson',
  //                         )
  //                       ]),
  //                 ),
  //                 SizedBox(
  //                   height: size.height * 0.7,
  //                   child: const TabBarView(children: [
  //                     Center(
  //                       child: Text('Audio'),
  //                     ),
  //                     Center(
  //                       child: Text('Video'),
  //                     )
  //                   ]),
  //                 )
  //               ],
  //             ),
  //           )
         