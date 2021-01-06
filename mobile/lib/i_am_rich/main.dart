import 'package:flutter/material.dart';

// => function has only one statement
main_1() => runApp(
      MaterialApp(
        home: Center(
          child: Text(
            'Hellow World.',
          ),
        ),
      ),
    );

main_2() {
  runApp(
    MaterialApp(
      home: Center(
        child: Text(
          'Hellow World.',
        ),
      ),
    ),
  );
}

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Image(
          image: NetworkImage(
            '',
          ),
        ),
        backgroundColor: Colors.red,
      ),
    ),
  );
}
