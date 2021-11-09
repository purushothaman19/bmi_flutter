import 'package:flutter/material.dart';
import 'constants.dart';

class CardChild extends StatelessWidget {

  CardChild({@required this.titleText, this.titleIcon});

  final String titleText;
  final IconData titleIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          titleIcon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          titleText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

