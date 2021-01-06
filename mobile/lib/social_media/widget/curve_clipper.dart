import 'package:flutter/cupertino.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curve_point_1 = Offset(size.width / 4, size.height);
    Offset curve_center = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
        curve_point_1.dx, curve_point_1.dy, curve_center.dx, curve_center.dy);
    Offset curve_point_part_3 = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset end_pint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
        curve_point_part_3.dx, curve_point_part_3.dy, end_pint.dx, end_pint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
