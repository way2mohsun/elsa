import 'package:flutter/material.dart';
import 'package:flutterapp/covid/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 28,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none),
          iconSize: 28,
          onPressed: () {},
        ),
      ],
    );
  }
}
