import 'dart:async';

import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  double itemSize = 0;
  double opacity = 1;

  Duration animationDuration = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {

    Timer(Duration(milliseconds: 1), () {
    });

    return AnimatedOpacity(
      duration: animationDuration,
      opacity: opacity,
      child: AnimatedContainer(
        duration: animationDuration,
        width: itemSize,
        height: itemSize,
        decoration: new BoxDecoration(
          color: Color(0XFFEC3457),
          shape: BoxShape.circle,
        ),
      ),
    );
  }


}