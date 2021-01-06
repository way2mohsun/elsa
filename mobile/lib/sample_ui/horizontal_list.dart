import 'package:flutter/material.dart';

//https://www.youtube.com/watch?v=6C5qvdUEfNc

class MyApp extends StatelessWidget {
  Widget horizontalList1 = new Container(
      margin: EdgeInsets.symmetric(vertical: 100.0),
      height: 200.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: 111.0, color: Colors.red,),
          Container(width: 160.0, color: Colors.orange,),
          Container(width: 100.0, color: Colors.pink,),
          Container(width: 160.0, color: Colors.yellow,),
        ],
      )
  );
  Widget horizontalList2 = new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: 160.0, color: Colors.blue,),
          Container(width: 160.0, color: Colors.green,),
          Container(width: 160.0, color: Colors.cyan,),
          Container(width: 160.0, color: Colors.black,),
        ],
      )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              horizontalList1,
              horizontalList2,
            ],
          ),
        ),
      ),
    );
  }


  /*
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: new Center(
        child: new Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              horizontalList1,
              horizontalList2,
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
   */

}