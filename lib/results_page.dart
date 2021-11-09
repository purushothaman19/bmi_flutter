import 'package:bmi_calculator/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {

  const ResultsPage({@required this.resultText, @required this.resultBMI, @required this.resultDesc});

  final String resultText;
  final String resultBMI;
  final String resultDesc;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child:
                    Text(
                      "Your Result",
                      style: kBottomTitle,
                    )
                ),
              ),
              Expanded(
                  flex: 5,
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(resultText, style: kResultText),
                        Text(resultBMI, style: kResultNum),
                        Text(resultDesc,
                            style: kResultDesc,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ),
              CalculateButton(
                bottomTitle: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ]
          )
    );
  }
}
