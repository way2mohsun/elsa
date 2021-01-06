import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blueGrey,
        backgroundColor: Colors.white,
        //height: 100,
        index: 2,
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.ease,
        onTap: (index){
          print(index);
        },
        items: [
          Icon(Icons.verified_user, size: 40, color: Colors.black),
          Icon(Icons.add, size: 40, color: Colors.black),
          Icon(Icons.list, size: 40, color: Colors.black),
          Icon(Icons.pages_rounded, size: 40, color: Colors.black),
          Icon(Icons.voicemail, size: 40, color: Colors.black),
        ],
      ),
    );
  }
}
