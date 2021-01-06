import 'package:flutter/material.dart';
import 'package:flutterapp/food_delivery/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food Delivery UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green[50],
        primaryColor: Colors.deepOrange,
      ),
      home: HomeScreen(),
    );
  }
}
