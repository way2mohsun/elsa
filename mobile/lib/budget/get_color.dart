import 'package:flutter/material.dart';

class GetColor{

  final BuildContext context;


  GetColor({this.context});

  getColor(double percentage) {
    if (percentage >= .5) {
      return Theme.of(context).primaryColor;
    }
    if (percentage >= .25) {
      return Colors.orange;
    }
    return Colors.red;
  }
}