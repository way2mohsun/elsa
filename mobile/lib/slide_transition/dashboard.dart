import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            return Navigator.pop(context);
          },
          child: Text('Move to Page 1 ...'),
        ),
      ),
    );
  }
}
