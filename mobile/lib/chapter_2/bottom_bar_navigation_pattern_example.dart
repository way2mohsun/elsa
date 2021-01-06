import 'package:flutter/material.dart';
import 'animated_bottom_bar.dart';

class BottomBarNavigationPatternExample extends StatefulWidget {
  final List<BarItem> barItem = [
    BarItem(
      text: "Home",
      icon: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Likes",
      icon: Icons.favorite_border,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Search",
      icon: Icons.search,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: "Profile",
      icon: Icons.person_outline,
      color: Colors.teal,
    ),
  ];

  @override
  _BottomBarNavigationPatternExampleState createState() =>
      _BottomBarNavigationPatternExampleState();
}

class _BottomBarNavigationPatternExampleState
    extends State<BottomBarNavigationPatternExample> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: widget.barItem[selectedIndex].color,
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barStyle: BarStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          iconSize: 25,
        ),
        barItem: widget.barItem,
        animationDuration: const Duration(milliseconds: 150),
        onBarTab: (index) {
          setState(() {});
          selectedIndex = index;
        },
      ),
    );
  }
}
