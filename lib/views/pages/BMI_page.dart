import 'dart:ui';

import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/result_page.dart';
import 'package:demo/views/widgets/gender_select.dart';
import 'package:demo/views/widgets/height_slider.dart';
import 'package:demo/views/widgets/num_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// BMI Formula
void CalculateBMI() {
  bmi.value = (weight.value) / ((height.value / 100) * (height.value / 100));
}

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Gender Selection
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: GenderSelect(),
        ),

        // Height Slider
        HeightSlider(),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weight
            ValueListenableBuilder(
              valueListenable: weight,
              builder: (context, weightValue, child) {
                return NumBox(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'W e i g h t',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            weight.value.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 3),
                          Text('kg'),
                        ],
                      ),

                      // Text Field Container
                      SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        width: 100,
                        child: ValueListenableBuilder(
                          valueListenable: isDarkMode,
                          builder: (context, isDark, child) {
                            return TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                              onChanged: (value) {
                                double? val = double.tryParse(value);
                                if (val != null) {
                                  weight.value = val;
                                }
                              },
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your weight',
                                hintStyle: TextStyle(
                                  fontSize: 8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.normal,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: isDark ? Colors.black : Colors.white,
                                    width: 3,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.indigo.shade300,
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                              ),
                              cursorHeight: 15,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(width: 20),

            // Age
            ValueListenableBuilder(
              valueListenable: age,
              builder: (context, ageValue, child) {
                return NumBox(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'A g e',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            age.value.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 3),
                          Text('y/o'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              age.value -= 1;
                              ageValue = age.value;
                            },
                            child: Text(
                              '—',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              age.value += 1;
                              ageValue = age.value;
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 20),

        // Calculate Button
        ValueListenableBuilder(
          valueListenable: bmi,
          builder: (context, bmiValue, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade100,
                  minimumSize: Size(200, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                onPressed: () {
                  CalculateBMI();
                  print(bmi.value);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage();
                      },
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'C a c u l a t e',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
