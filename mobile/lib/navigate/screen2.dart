import 'package:flutter/material.dart';
import 'package:flutterapp/navigate/screen1.dart';

class Screen2 extends StatelessWidget {

  static final id = '/second';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
    );
  }
}