import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4e5f),
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
    );
  }
}