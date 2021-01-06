import 'package:flutter/material.dart';
import 'draw_screen.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(


        children: [
          DrawScreen(),
        
          HomeScreen(),

        ],
      ),
    );
  }
}
