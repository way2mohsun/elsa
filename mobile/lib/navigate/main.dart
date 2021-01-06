import 'package:flutter/material.dart';
import 'package:flutterapp/navigate/screen0.dart';
import 'package:flutterapp/navigate/screen2.dart';
import 'screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      //home: Screen0() important one of them should be mentioned
      routes: {
        Screen0.id: (context) => Screen0(),
        Screen1.id: (context) => Screen1(),
        Screen2.id: (context) => Screen2(),
      },
    );
  }
}
