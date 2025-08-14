import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: Colors.teal.shade300,
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          const Text(
            'H e i g h t:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          ValueListenableBuilder(
            valueListenable: height,
            builder: (context, sliderValue, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sliderValue.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(' cm', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Slider(
                    min: 30.0,
                    max: 240,
                    divisions: 420,
                    value: sliderValue,
                    onChanged: (value) {
                      height.value = value;
                    },
                    thumbColor: (isDarkMode.value)
                        ? Colors.white
                        : Colors.black,
                    inactiveColor: Colors.blueGrey,
                    activeColor: (isDarkMode.value) ? Colors.indigo.shade600 : Colors.teal.shade100,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
