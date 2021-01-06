import 'input_page.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      /*
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
       */
      /*
      floatActionButton: Theme (
        data: ThemeData(
          accentColor: Colors.purple,
        ),
        child : ......
      )
      */
      home: InputPage(),
    );
  }
}
