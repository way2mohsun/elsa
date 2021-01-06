import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'my_slide.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Route route = MySlide(
              builder: (context) {
                return Dashboard();
              },
            );
            Route route_2 = MySlideDuration(widget: Dashboard());
            return Navigator.push(context, route_2);
          },
          child: Text('Move to Page 2 ...'),
        ),
      ),
    );
  }
}
