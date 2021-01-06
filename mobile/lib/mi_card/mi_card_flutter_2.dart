import 'package:flutter/material.dart';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

void main() => runApp(MyCard());

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            //mainAxisSize: MainAxisSize.max,//free space
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,//chideman
            //
            verticalDirection: VerticalDirection.up,//Alignment from up down or visa versa
            //
            crossAxisAlignment: CrossAxisAlignment.stretch,//Alignment right left or visa versa
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white,
                child: Text('Container 1'),
              ),
              SizedBox(width: 10.0,),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                height: 100.0,
                //width: double.infinity,
                color: Colors.red,
                child: Text('Container 3'),
              ),
//              Container(
//                width: double.infinity,
//                height: 10.0,
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
