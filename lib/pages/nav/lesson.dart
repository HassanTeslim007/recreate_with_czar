import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';

class Lesson extends StatelessWidget {
  const Lesson({super.key});

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
                        margin: const EdgeInsets.all(5), color: Colors.red),
                    Container(color: Colors.green)
                  ],
                  onChange: (index) => print(index),
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
      margin: const EdgeInsets.symmetric(horizontal: 45),
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
              const Text(
                '🔥 2',
                style: TextStyle(fontSize: 16),
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
         