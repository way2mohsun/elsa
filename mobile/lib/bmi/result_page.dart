import 'package:flutter/material.dart';
import 'package:flutterapp/bmi/ReusableCard.dart';
import 'BottomButton.dart';

import 'constants.dart';

class Result extends StatelessWidget {
  final String result;
  final String bmi;

  const Result({this.result, this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: k_title_result,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: k_active_card_color,
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: k_result,
                  ),
                  Text(
                    bmi,
                    style: k_bmi,
                  ),
                  Text(
                    'Your bmi is to short, eat more !',
                    style: k_result_text,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Bottom(
            b_label: 're-calculate',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
