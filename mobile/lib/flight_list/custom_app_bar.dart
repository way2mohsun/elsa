import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItem = [];

  CustomAppBar() {
    bottomBarItem.add(
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
        ),
        backgroundColor: Colors.black,
        icon: Icon(
          Icons.home,
        ),
        label: "Explore",
      ),
    );
    bottomBarItem.add(
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
        ),
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.favorite,
        ),
        label: "Watchlist",
      ),
    );
    bottomBarItem.add(
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
        ),
        backgroundColor: Colors.blue,
        icon: Icon(
          Icons.local_offer,
        ),
        label: "Deals",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1, // ❊
      child: BottomNavigationBar(
        currentIndex: 1,
        items: bottomBarItem,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
