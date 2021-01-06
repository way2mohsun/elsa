import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final Color b = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.library_books, color: b),
          Icon(Icons.search, color: b),
          Icon(Icons.add, color: b),
          Icon(Icons.alarm, color: b),
          Icon(Icons.chat, color: b),
        ],
      ),
    );
  }
}
