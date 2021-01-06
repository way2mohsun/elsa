import 'package:flutter/material.dart';

class MySlide extends MaterialPageRoute {
  MySlide({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Animation<Offset> custom =
        Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 0))
            .animate(animation);
    return SlideTransition(
      position: custom,
      child: child,
    );
  }
}

class MySlideDuration extends PageRouteBuilder {
  Widget widget;

  MySlideDuration({this.widget})
      : super(
          // makes complete page
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          // call when apply the route
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Animation<Offset> custom = Tween<Offset>(
              begin: Offset(1, 1),
              end: Offset(0, 0),
            ).animate(animation);
            return SlideTransition(
              position: custom,
              child: child,
            );
          },
          transitionDuration: Duration(seconds: 1),
        );
}
