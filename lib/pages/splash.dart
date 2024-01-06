import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recreate_with_czar/pages/onboarding.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSub = false;
  int seconds = 0;
  late Timer timer;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      showSub = true;
      setState(() {});
    });

    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds = timer.tick;
      setState(() {
        log(seconds.toString());
      });
      if (seconds == 6) {
        timer.cancel();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Onboarding()));
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/bg1.svg',
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 100,
              left: size.width / 4,
              right: size.width / 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1000),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, val, child) {
                        return Opacity(
                            opacity: val,
                            child: Container(
                              margin: const EdgeInsets.only(top: 6),
                              child: SvgPicture.asset(
                                'assets/toplines.svg',
                              ),
                            ));
                      }),
                  xSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TweenAnimationBuilder(
                        tween: Tween(begin: 0.2, end: 1.0),
                        duration: const Duration(milliseconds: 3000),
                        builder: (context, val, child) {
                          return Opacity(opacity: val, child: child!);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Text(
                                  'Speak',
                                  style: TextStyle(
                                    fontSize: 40,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2
                                      ..color = splashOrange,
                                  ),
                                ),
                                const Text(
                                  'Speak',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: [
                                Text(
                                  'Sphere',
                                  style: TextStyle(
                                    fontSize: 40,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2
                                      ..color = splashOrange,
                                  ),
                                ),
                                Text(
                                  'Sphere',
                                  style: TextStyle(
                                    color: splashOrange,
                                    fontSize: 40,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      showSub
                          ? TweenAnimationBuilder(
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: const Duration(milliseconds: 200),
                              builder: (context, val, child) {
                                return Opacity(opacity: val, child: child!);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        '...speak the word',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 2
                                            ..color = primaryBrown,
                                        ),
                                      ),
                                      const Text(
                                        '..speak the word',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: size.height / 2 - 100,
                right: 0,
                child: SvgPicture.asset(
                  'assets/splash_chat.svg',
                )),
            Positioned(
                top: size.height / 2 - 100,
                child: SvgPicture.asset(
                  'assets/splash_man.svg',
                  width: size.width / 2 + 20,
                )),
            if (seconds > 2)
              Positioned(
                  top: size.height / 1.8 + 10,
                  left: size.width / 3 + 20,
                  child: SvgPicture.asset(
                    'assets/tick1.svg',
                  )),
            if (seconds > 3)
              Positioned(
                  top: size.height / 1.8 + 10,
                  left: size.width / 3 + 25,
                  child: SvgPicture.asset(
                    'assets/tick2.svg',
                  )),
            if (seconds > 4)
              Positioned(
                  top: size.height / 1.8 + 10,
                  left: size.width / 3 + 22,
                  child: SvgPicture.asset(
                    'assets/tick3.svg',
                  )),
            Positioned(
                right: 0,
                top: size.height / 2,
                child: SvgPicture.asset(
                  'assets/splash_woman.svg',
                  width: size.width,
                ))
          ],
        ),
      ),
    );
  }
}
