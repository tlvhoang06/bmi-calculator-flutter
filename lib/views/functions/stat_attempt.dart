import 'package:demo/data/notifer.dart';
import 'package:demo/views/functions/app_function.dart';
import 'package:flutter/material.dart';

class StatusAndAttempt extends StatelessWidget {
  const StatusAndAttempt({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 420,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        color: Color(0XFFdde7c7),
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              Status(bmi.value),
              style: TextStyle(
                color: StatusColor(bmi.value),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              BmiCompliment(bmi.value),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0XFF001427),
              ),
            ),
            SizedBox(height: 15),
            Text(
              (18.5 <= bmi.value && bmi.value <= 24.9)
                  ? 'Your weight is in the healthy range - maintain it!'
                  : 'You need to ${(bmi.value <= 24.9) ? 'gain' : 'lose'} around ${WeightToChange(bmi.value, bmi.value > 24.9).abs().ceilToDouble()} kg',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0XFF001427),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
