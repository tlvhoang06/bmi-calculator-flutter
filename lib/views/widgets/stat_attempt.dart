import 'package:demo/data/notifer.dart';
import 'package:demo/views/functions/function.dart';
import 'package:flutter/material.dart';

class StatusAndAttempt extends StatelessWidget {
  const StatusAndAttempt({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 450,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        color: Color(0XFFdde7c7),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Result(bmi.value),
                  style: TextStyle(
                    color: StatusColor(bmi.value),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  (18.5 <= bmi.value && bmi.value <= 24.9)
                      ? 'Your weight is in the healthy range - maintain it!'
                      : 'You need to ${(bmi.value <= 24.9) ? 'gain' : 'lose'} ${WeightToChange(bmi.value, bmi.value > 24.9)} kg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
