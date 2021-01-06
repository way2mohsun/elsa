import 'package:flutter/material.dart';

class Stacks extends StatefulWidget {
  @override
  _StacksState createState() => _StacksState();
}

class _StacksState extends State<Stacks> {
  List<Widget> pages = [];
  bool set = true;

  _page(Size size) {
    set =!set;
    if(!set) {
      pages = [];
      pages.add(Positioned.fill(
        key: GlobalKey(),
        child: Container(
          color: Colors.white,
        ),
      ));
      return pages;
    }
    pages.add(Positioned.fill(
      key: GlobalKey(),
      child: Container(
        color: Colors.white,
      ),
    ));
    pages.add(AnimatedOpacity(
      key: GlobalKey(),
      duration: Duration(milliseconds: 3000),
      opacity: .1,
      child: Container(
        width: size.width - (size.width * 20 / 100),
        height: size.height - 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    ));

    pages.add(Container(
      key: GlobalKey(),
      width: size.width - (size.width * 25 / 100),
      height: size.height - 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    ));
    pages.add(Container(
      width: size.width - (size.width * 23 / 100),
      height: size.height - 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    ));
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('press me'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              setState(() {
              });
            },
          ),
        ],
      ),
      body: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: _page(MediaQuery.of(context).size),
        ),
      ),
    );
  }
}
