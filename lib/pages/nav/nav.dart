import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:recreate_with_czar/pages/nav/chats.dart';
import 'package:recreate_with_czar/pages/nav/exercises.dart';
import 'package:recreate_with_czar/pages/nav/games.dart';
import 'package:recreate_with_czar/pages/nav/home.dart';
import 'package:recreate_with_czar/pages/nav/lesson.dart';
import 'package:recreate_with_czar/utils/colors.dart';
import 'package:recreate_with_czar/utils/util.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
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
      body: _buildScreens().elementAt(index),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SvgPicture.asset('assets/nav/home.svg'),
          ],
        ),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/lesson.svg'),
        title: ("Lesson"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/exercises.svg'),
        title: ("Exercises"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.control_point_duplicate_rounded),
        title: ("Games"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/chats.svg'),
        title: ("Chats"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
