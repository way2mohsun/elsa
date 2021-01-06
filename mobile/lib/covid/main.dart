import 'package:flutter/material.dart';

import 'bottom_nav_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
title: "Flutter Covid-19 Dashboard",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: BottomNavScreen(),
    );
  }
}
