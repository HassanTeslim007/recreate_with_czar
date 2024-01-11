import 'package:flutter/material.dart';
import 'package:recreate_with_czar/pages/empty_screen.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Empty(),
          ],
        ),
      )),
    );
  }
}