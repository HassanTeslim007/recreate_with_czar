import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          backgroundColor: scaffoldBgColor,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/nav/home.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/nav/home_selected.svg',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/nav/lesson.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/nav/lesson_selected.svg',
              ),
              label: 'Lesson',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/nav/exercises.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/nav/exercises_selected.svg',
              ),
              label: 'Exercices',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/nav/games.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/nav/games_selected.svg',
              ),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/nav/chats.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/nav/chats_selected.svg',
              ),
              label: 'Chats',
            ),
          ],
          selectedItemColor: primaryBrown,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
        ),
      ),
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
