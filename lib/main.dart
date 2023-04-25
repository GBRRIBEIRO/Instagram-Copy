import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/direct/dm_page.dart';
import 'package:instagram_copy/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);

  void goHome() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void goDm() {
    pageController.animateTo(
      1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: PageView(
        controller: pageController,
        children: [
          HomePage(goDm),
          DirectMessagePage(goHome),
        ],
      ),
    );
  }
}
