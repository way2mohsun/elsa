import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItem;
  final Duration animationDuration;
  final Function onBarTab;
  final BarStyle barStyle;

  AnimatedBottomBar({
    this.onBarTab,
    this.barStyle,
    this.barItem,
    this.animationDuration = const Duration(
      milliseconds: 500,
    ),
  });

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 32,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItem.length; i++) {
      bool isSelected = selectedBarIndex == i;
      BarItem item = widget.barItem[i];
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTab(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          duration: widget.animationDuration,
          decoration: BoxDecoration(
            color:
                isSelected ? item.color.withOpacity(.15) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: isSelected ? item.color : Colors.black,
                size: widget.barStyle.iconSize,
              ),
              SizedBox(width: 10),
              AnimatedSize(
                duration: widget.animationDuration,
                curve: Curves.easeIn,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(
                    color: item.color,
                    fontWeight: widget.barStyle.fontWeight,
                    fontSize: widget.barStyle.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return _barItems;
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle({
    this.fontSize = 18,
    this.iconSize = 32,
    this.fontWeight = FontWeight.w600,
  });
}

class BarItem {
  final String text;
  final IconData icon;
  final Color color;

  BarItem({
    this.text,
    this.icon,
    this.color,
  });
}
