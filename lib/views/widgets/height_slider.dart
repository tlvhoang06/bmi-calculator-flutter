import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      color: Color(0XFFb8f2e6),
      child: SizedBox(
        height: 170,
        width: 400,
        child: ValueListenableBuilder(
          valueListenable: height,
          builder: (context, sliderValue, child) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'H e i g h t:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
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
                  thumbColor: (isDarkMode.value) ? Colors.white : Colors.black,
                  inactiveColor: Colors.blueGrey,
                  activeColor: (isDarkMode.value)
                      ? Colors.indigo.shade600
                      : Colors.blueAccent.shade200,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
