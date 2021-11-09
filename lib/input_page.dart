import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_child.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_bottom.dart';
import 'calculate_bmi.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 17;

  // another method
  // Color maleCardColor = activeColor;
  // Color femaleCardColor = activeColor;

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
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kInactiveColor
                      : kActiveColor,
                  cardChild: CardChild(
                      titleIcon: FontAwesomeIcons.mars, titleText: "MALE"),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kInactiveColor
                      : kActiveColor,
                  cardChild: CardChild(
                      titleIcon: FontAwesomeIcons.venus, titleText: "FEMALE"),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT", style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberStyle),
                    Text("cm", style: kLabelTextStyle),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20),
                        trackHeight: 2,
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Text("Kg", style: kLabelTextStyle),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          CalculateButton(
              bottomTitle: "CALCULATE",
              onTap: () {

                CalculateBMI bmi = CalculateBMI(height: height, weight: weight);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      resultBMI: bmi.resultBMI(),
                      resultDesc: bmi.resultDesc(),
                      resultText: bmi.resultText(),
                    )));
              },
          )
        ],
      ),
    );
  }
}
