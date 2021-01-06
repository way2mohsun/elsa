import 'package:flutter/material.dart';
import 'constants.dart';

class Bottom extends StatelessWidget {
  Bottom({this.b_label, this.onTap});

  final String b_label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Center(
            child: Text(
          b_label,
          style: k_large_buttom_style,
        )),
        color: k_bottom_container_color,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: k_bottom_container_higher,
      ),
    );
  }
}
