import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recreate_with_czar/core/utils/util.dart';
import 'package:recreate_with_czar/pages/nav/chats.dart';
import 'package:recreate_with_czar/pages/nav/exercises.dart';
import 'package:recreate_with_czar/pages/nav/games.dart';
import 'package:recreate_with_czar/pages/nav/home.dart';
import 'package:recreate_with_czar/pages/nav/lesson.dart';
import 'package:recreate_with_czar/core/utils/colors.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int index = 0;
  List navItems = ['Home', 'Lesson', 'Exercises', 'Games', 'Chats'];
  @override
  Widget build(BuildContext context) {
    // return PersistentTabView(
    //   context,
    //   controller: _controller,
    //   screens: _buildScreens(),
    //   items: _navBarsItems(),
    //   confineInSafeArea: true,
    //   backgroundColor: Colors.white, // Default is Colors.white.
    //   handleAndroidBackButtonPress: true, // Default is true.
    //   resizeToAvoidBottomInset:
    //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
    //   stateManagement: true, // Default is true.
    //   hideNavigationBarWhenKeyboardShows:
    //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
    //   decoration: NavBarDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     colorBehindNavBar: Colors.white,
    //   ),
    //   popAllScreensOnTapOfSelectedTab: true,
    //   popActionScreens: PopActionScreensType.all,
    //   itemAnimationProperties: const ItemAnimationProperties(
    //     // Navigation Bar's items animation properties.
    //     duration: Duration(milliseconds: 200),
    //     curve: Curves.ease,
    //   ),
    //   screenTransitionAnimation: const ScreenTransitionAnimation(
    //     // Screen transition animation on change of selected tab.
    //     animateTabTransition: true,
    //     curve: Curves.ease,
    //     duration: Duration(milliseconds: 200),
    //   ),
    //   navBarStyle:
    //       NavBarStyle.style3, // Choose the nav bar style with this property.
    // );
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeTransition(opacity: primaryAnimation, child: child),
          child: _buildScreens().elementAt(index)),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: scaffoldBgColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(4, 0),
                spreadRadius: 0,
              )
            ],
          ),
          height: kToolbarHeight + 5,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                  navItems.length,
                  (index) => InkWell(
                        onTap: () {
                          setState(() {
                            this.index = index;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            this.index == index
                                ? Container(
                                    width: 30,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: primaryBrown,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                  )
                                : ySpace(0),
                            SvgPicture.asset(
                              this.index == index
                                  ? 'assets/nav/${navItems[index].toString().toLowerCase()}_selected.svg'
                                  : 'assets/nav/${navItems[index].toString().toLowerCase()}.svg',
                              width: navItems[index] == 'Games' ? 35 : 20,
                            ),
                            Text(
                              navItems[index],
                              style: TextStyle(
                                  color: this.index == index
                                      ? primaryBrown
                                      : borderColor),
                            )
                          ],
                        ),
                      ))
            ],
          )),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Lesson(),
      const Exercises(),
      const Games(),
      const Chats()
    ];
  }
}
