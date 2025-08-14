import 'dart:math';

import 'package:flutter/material.dart';
import 'package:demo/data/notifer.dart';

// BMI Formula
void CalculateBMI() {
  bmi.value = (weight.value) / ((height.value / 100) * (height.value / 100));
}

// Status
String Result(double bmi) {
  String res;
  if (bmi < 18.5) {
    res = "Underweight";
  } else if (bmi < 25) {
    res = "Normal";
  } else if (bmi < 30) {
    res = "Overweight";
  } else if (bmi < 40) {
    res = "Obese";
  } else {
    res = "Morbidly Obese";
  }
  return res;
}

// Status Color
Color StatusColor(double bmi){
  Color res;
  if (bmi < 18.5) {
    res = Color(0xFF264653);
  } else if (bmi < 25) {
    res = Color(0XFF2a9d8f);
  } else if (bmi < 30) {
    res = Color(0XFFe9c46a);
  } else if (bmi < 40) {
    res = Color(0XFFf4a261);
  } else {
    res = Color(0XFFe76f51);
  }
  return res;
}

/// Weight change required for normal BMI
double WeightToChange(double bmi, bool over){
  double idealWeight = sqrt((bmi / (over ? 24.9 : 18.5)) * pow(weight.value, 2));
  return weight.value - idealWeight;
}