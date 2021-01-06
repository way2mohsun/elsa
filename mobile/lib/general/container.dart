import 'package:flutter/material.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Container(
          color: Colors.red,
          child: Text('SalaM'),
          //alignment: Alignment.topLeft,
        ),
      ),
    );
  }
}


class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          color: Colors.red,
          child: Container(// refer to parent
            margin: const EdgeInsets.all(100.0),
            //color: Colors.amber[600],
            child: Text('Hi'),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            //width: 48.0,
            //height: 48.0,
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            height: 100.0,
            width: 100.0,
            //margin: EdgeInsets.only(left: 100.0, right: 100.0, top: 100.0, bottom: 100.0),
            //margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 100.0),
            //margin: EdgeInsets.fromLTRB(100.0, 100.0, 100.0, 100.0,),
            padding: EdgeInsets.all(20,),
            color: Colors.red,
            child: Text('Hello Wolrd.'), // defult corner left
          ),
        ),
      ),
    );
  }
}
