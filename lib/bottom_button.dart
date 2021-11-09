import 'package:flutter/material.dart';
import 'constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({@required this.bottomTitle, @required this.onTap});

  final String bottomTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            bottomTitle,
            style: kCalcButton,
          ),
        ),
        color: kBottomContainer,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
