import 'dart:math';

class Calculator {

  final int height;
  final int weight;
  double _res;

  Calculator({this.height, this.weight});

  String bmi () {
    _res = weight / pow(height / 100, 2);
    return _res.toStringAsFixed(1);
  }

  String result() {
    //print(_res.toStringAsFixed(1));
    if (_res >= 25) {
      return 'Overweight';
    } else if (_res > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
