import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

class Gender extends StatelessWidget {
  Gender({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: k_text_style,
        ),
      ],
    );
  }
}
