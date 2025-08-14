import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';


class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: PrettyGauge(
            minValue: 0,
            maxValue: 50,
            needleColor: Color(0XFF0081a7),
            currentValue: bmi.value,
            gaugeSize: 300,
            showMarkers: false,
            valueWidget: Text(((bmi.value > 50) ? 50 : bmi.value).toStringAsFixed(1)),
            segments: [
              GaugeSegment('Underweight', 18.4, Color(0xFF264653)), // < 18.5
              GaugeSegment('Normal', 6.5, Color(0XFF2a9d8f)), // 18.5 to 24.9
              GaugeSegment('Overweight', 5, Color(0XFFe9c46a)), // 25 to 29.9
              GaugeSegment('Obese', 9.9, Color(0XFFf4a261)), // 30 to 39.9
              GaugeSegment('Morbidly Obese', 10.2, Color(0XFFe76f51)), // > 40
            ],
          ),
        ),
      ],
    );
  }
}