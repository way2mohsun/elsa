import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/social_app/profile_page_view.dart';
import 'app_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightFactorAnimation;
  double expandedHeightFactor = .9;
  double collapsedHeightFactor = .7;
  double screenHeight;
  bool isAnimationCompleted = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _heightFactorAnimation = Tween(
      begin: expandedHeightFactor,
      end: collapsedHeightFactor,
    ).animate(_controller);
/*

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isAnimationCompleted = true;
      }
    });
*/

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onBottomPartTap() {
    setState(() {
      if (isAnimationCompleted)
        _controller.fling(velocity: -1);
      else
        _controller.fling(velocity: 1);
      isAnimationCompleted = !isAnimationCompleted;
    });
  }

  getWidget() {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      bottomNavigationBar: AppBottomBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: _heightFactorAnimation.value,
            child: ProfilePageView(),
          ),
          GestureDetector(
            onTap: () {
              onBottomPartTap();
            },
            onVerticalDragUpdate: handleVerticalUpdate,
            onVerticalDragEnd: handleVerticalEnd,
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 1 - _heightFactorAnimation.value + .04,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffeeeeee),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  handleVerticalUpdate(DragUpdateDetails d) {
    // d.delta.dy is equal d.primaryDelta
    double fractionDragged = d.primaryDelta / screenHeight;
    print(
        '${_controller.value} : ${d.globalPosition.dy} : ${d.primaryDelta} : ${fractionDragged}');
    _controller.value = _controller.value - fractionDragged * 5;
  }

  handleVerticalEnd(DragEndDetails d) {
    if (_controller.value >= .5) {
      _controller.fling(velocity: 1); // equal _controller.forward();
    } else {
      _controller.fling(velocity: -1); // equal _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) {
        return getWidget();
      },
    );
  }
}
