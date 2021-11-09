import 'dart:math';

import 'package:flutter/foundation.dart';

class CalculateBMI {

  CalculateBMI({@required this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String resultBMI() {

    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }

  String resultText() {

    if (_bmi>=25){
      return "Overweight";
    }

    else if (_bmi>18.5){
      return "Normal";
    }

    else{
      return "Underweight";
    }

  }

  String resultDesc(){

    if (_bmi>=25){
      return "You are higher than your body weight. DO exercise";
    }

    else if (_bmi>18.5){
      return "You're having a normal body bmi. Good Luck!";
    }

    else{
      return "You are lower than your body weight. You can eat a bit more";
    }

  }


}
