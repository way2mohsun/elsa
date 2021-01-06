import 'package:flutter/material.dart';

class RatingStarts extends StatelessWidget {
  final int rating_stars;

  RatingStarts({this.rating_stars});

  @override
  Widget build(BuildContext context) {
    String rate = '';
    for (int i = 0; i < rating_stars; i++) {
      //rate += '☆'; //⭐
      rate += '⭐';
    }
    rate = rate.trim();
    return Text(
      rate,
      style: TextStyle(
        letterSpacing: 4,
        fontSize: 20,
      ),
    );
  }
}
