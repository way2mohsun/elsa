import 'package:flutter/material.dart';

class TwoLineItems extends StatelessWidget {
  final String first_text, second_text;
  final CrossAxisAlignment crossAxisAlignment;

  TwoLineItems({
    this.first_text,
    this.second_text,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          first_text,
          style: style,
        ),
        Text(
          second_text,
          style: style.copyWith(fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}

final style = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);
