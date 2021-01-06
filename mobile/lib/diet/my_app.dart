import 'package:flutter/material.dart';
import 'package:flutterapp/diet/profile_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,

      ),
      home: ProfileScreen(),
    );
  }
}
