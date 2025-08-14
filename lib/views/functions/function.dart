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
  if (bmi <= 18.4) {
    res = "Underweight";
  } else if (bmi <= 24.9) {
    res = "Normal";
  } else if (bmi <= 29.9) {
    res = "Overweight";
  } else if (bmi <= 39.9) {
    res = "Obese";
  } else {
    res = "Morbidly Obese";
  }
  return res;
}

// Status Color
Color StatusColor(double bmi) {
  Color res;
  if (bmi <= 18.4) {
    res = Color(0xFF264653);
  } else if (bmi <= 24.9) {
    res = Color(0XFF2a9d8f);
  } else if (bmi <= 29.9) {
    res = Color(0XFFe9c46a);
  } else if (bmi < 40) {
    res = Color(0XFFf4a261);
  } else {
    res = Color(0XFFe76f51);
  }
  return res;
}

// BMI Compliments
String BmiCompliment(double bmi) {
  if (bmi < 18.5) {
    return "Keep nourishing yourself, you can gain weight healthily!";
  } else if (bmi <= 24.9) {
    return "Great job!";
  } else if (bmi <= 29.9) {
    return "A little adjustment in diet and exercise can help you!";
  } else if (bmi <= 39.9) {
    return "Time to focus on fitness and balanced meals!";
  } else {
    return "Seek professional guidance for your health!";
  }
}

// Weight change required for normal BMI
double WeightToChange(double bmi, bool over) {
  double idealWeight = ((over ? 24.9 : 18.5) * pow(height.value * 0.01, 2)) * 1.0;
  return (weight.value - idealWeight);
}