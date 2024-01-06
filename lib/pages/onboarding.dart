import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recreate_with_czar/pages/nav/nav.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int count = 0;
  List items = [
    'Studies',
    'Reading',
    'Technology',
    'Travel',
    'Gaming',
    'Psychology',
    'TV/Movies',
    'Sports',
    'Languages',
    'Fashion',
    'Fitness',
    'Pets',
    'Food',
    'Self-care',
    'WorkLife',
    'Culture',
    'Design',
    'Sociology',
    'Music',
    'Outdoor',
    'Networking',
    'Romance',
    'Shopping',
    'Sight-Seeing'
  ];
  List selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
                percent: count <= 6 ? (count / 6) : 1,
                progressColor: primaryBrown,
                backgroundColor: const Color(0xFF908989),
              )),
              xSpace(5),
              Text('$count/6')
            ],
          ),
          ySpace(20),
          const Text(
            'What intrests you?',
            style: TextStyle(fontSize: 20),
          ),
          ySpace(10),
          const Text(
            'Select all that applies',
            style: TextStyle(fontSize: 13, color: Color(0xFF908989)),
          ),
          ySpace(30),
          Wrap(
            spacing: 8.0,
            runSpacing: 20.0,
            children: items.map((item) {
              final isSelected = selectedItems.contains(item);

              return DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                dashPattern: isSelected ? [5, 0] : [10, 6],
                padding: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (!isSelected) {
                        count += 1;
                        if (selectedItems.length < 6) {
                          selectedItems.add(item);
                        } else {
                          // Notify the user that they can't select more items.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('You can only select up to 6 items.'),
                            ),
                          );
                        }
                      } else {
                        count -= 1;
                        selectedItems.remove(item);
                      }
                    });
                  },
                  child: IntrinsicWidth(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isSelected
                              ? primaryBrown.withOpacity(0.4)
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          item,
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16.0),
          IntrinsicWidth(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: primaryBrown),
                  borderRadius: BorderRadius.circular(20),
                  color: primaryBrown.withOpacity(0.4)),
              child: const Center(
                child: Text(
                  'Add other +',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                width: double.maxFinite,
                height: 56,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryBrown),
                    onPressed: () {
                      navigateTo(context, const Nav());
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                width: double.maxFinite,
                height: 56,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 0),
                    onPressed: () {
                      navigateTo(context, const Nav());
                    },
                    child: Text(
                      'Skip for now',
                      style: TextStyle(color: primaryBrown, fontSize: 20),
                    )),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
