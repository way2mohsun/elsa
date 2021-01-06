import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/bmi/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BottomButton.dart';
import 'ReusableCard.dart';
import 'calculator.dart';
import 'constants.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Genders {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = k_inactive_card_color;
  Color femaleCardColor = k_inactive_card_color;

  Genders gender;

  int height = 180;
  int weight = 60;
  int age = 35;

  updateColor(Genders gender) {
    if (gender == Genders.female) {
      if (femaleCardColor == k_inactive_card_color) {
        femaleCardColor = k_active_card_color;
        maleCardColor = k_inactive_card_color;
        return;
      }
      femaleCardColor = k_inactive_card_color;
      return;
    }
    if (maleCardColor == k_inactive_card_color) {
      femaleCardColor = k_inactive_card_color;
      maleCardColor = k_active_card_color;
      return;
    }
    maleCardColor = k_inactive_card_color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Genders.female;
                      });
                    },
                    card_child: Gender(
                      icon: FontAwesomeIcons.mars,
                      label: 'Female',
                    ),
                    colour: gender == Genders.female
                        ? k_active_card_color
                        : k_inactive_card_color,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Genders.male;
                      });
                    },
                    card_child: Gender(
                      icon: FontAwesomeIcons.venus,
                      label: 'Male',
                    ),
                    colour: gender == Genders.male
                        ? k_active_card_color
                        : k_inactive_card_color,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: k_inactive_card_color,
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: k_text_style,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: k_text_style_num,
                      ),
                      Text(
                        'cm',
                        style: k_text_style,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8E8D98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 150.0,
                      max: 200.0,
                      onChanged: (double val) {
                        setState(() {
                          height = val.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: k_inactive_card_color,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: k_text_style,
                        ),
                        Text(
                          weight.toString(),
                          style: k_text_style_num,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconWidget(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  --weight;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconWidget(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  ++weight;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: k_inactive_card_color,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: k_text_style,
                        ),
                        Text(
                          age.toString(),
                          style: k_text_style_num,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconWidget(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  --age;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconWidget(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  ++age;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottom(
            b_label: 'Calculate',
            onTap: () {
              Calculator c = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (Container) =>
                      Result(bmi: c.bmi(), result: c.result()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconWidget extends StatelessWidget {
  RoundIconWidget({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        child: Icon(this.icon),
        onPressed: onPressed,
        elevation: 0.0,
        // flat
        disabledElevation: 6.0,
        /*constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        )*/
        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 60.0),
        shape: CircleBorder(),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        fillColor: Color(0xFF4C4F5E),
      ),
    );
  }
}
