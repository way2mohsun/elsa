import 'package:flutter/material.dart';
import 'bottom_bar_navigation_pattern_example.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Simple Application",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBarNavigationPatternExample(),
    );
  }
}
