import 'package:flutter/material.dart';
import 'dart:math';

//056

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var left_dice_number = 3;
  var right_dice_number = 1;

  Function setValue() {
    setState(() {
      left_dice_number = Random().nextInt(6) + 1;
      right_dice_number = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
  //var data; is like dynamic data;
  //var data = 10; is like int data = 10;

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            //RaisedButton
            child: FlatButton(
              onPressed: () {
                setValue;
              },
              child: Image(
                image: AssetImage('image/img/dice$left_dice_number.png'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            //RaisedButton
            child: FlatButton(
              onPressed: () {
                setValue;
              },
              child: Image(
                image: AssetImage('image/img/dice$right_dice_number.png'),
              ),
            ),
          ),
          /*
          Expanded(
            child: Padding (
              padding: const EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('image/img/dice$right_dice_number.png'),
              ),
            ),
          ),
          */
        ],
      ),
    );
  }
}
