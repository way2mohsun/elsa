import 'package:flutter/material.dart';

void main() => runApp(MyCard());

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            height: 100,
            width: 100,
            //margin: EdgeInsets.all(30),
            //margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
            //margin: EdgeInsets.fromLTRB(30.0, 40.0, 50.0, 60.0),
            margin: EdgeInsets.only(left: 100.0),
            padding: EdgeInsets.all(30.0),
            color: Colors.white,
            child: Text('Hello'),
          ),
        ),
      ),
    );
  }
}
