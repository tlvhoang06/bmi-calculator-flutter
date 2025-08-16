import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class GaugeChart extends StatelessWidget {
  const GaugeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      height: 370,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        color: Color(0XFFdde7c7),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: [
                Text('Y o u r  S c o r e',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF001427))),
                PrettyGauge(
                  minValue: 0,
                  maxValue: 50,
                  needleColor: Color(0XFF03045e),
                  currentValue: (bmi.value > 50) ? 50 : bmi.value,
                  gaugeSize: 320,
                  showMarkers: false,
                  valueWidget: Text(
                    bmi.value.toStringAsFixed(1),
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0XFF001427)),
                  ),
                  segments: [
                    GaugeSegment('Underweight', 18.4, Color(0xFF264653)), // < 18.5
                    GaugeSegment('Normal', 6.5, Color(0XFF2a9d8f)), // 18.5 to 24.9
                    GaugeSegment('Overweight', 5, Color(0XFFe9c46a)), // 25 to 29.9
                    GaugeSegment('Obese', 9.9, Color(0XFFf4a261)), // 30 to 39.9
                    GaugeSegment('Morbidly Obese', 10.2, Color(0XFFe76f51)), // > 40
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
