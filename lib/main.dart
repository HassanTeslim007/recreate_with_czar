import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recreate_with_czar/pages/splash.dart';
import 'package:recreate_with_czar/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBgColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: GoogleFonts.josefinSansTextTheme()),
        home: const SplashScreen());
  }
}
