import 'package:demo/data/notifer.dart';
import 'package:demo/views/functions/app_function.dart';
import 'package:demo/views/pages/result_page.dart';
import 'package:demo/views/widgets/gender_select.dart';
import 'package:demo/views/widgets/height_slider.dart';
import 'package:demo/views/widgets/increment_decrement_buttons.dart';
import 'package:demo/views/widgets/stat_card.dart';
import 'package:demo/views/widgets/text_type_box.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gender Selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: GenderSelect(),
            ),

            // Height Slider
            HeightSlider(),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Weight
                ValueListenableBuilder(
                  valueListenable: weight,
                  builder: (context, weightValue, child) {
                    return StatCard(
                      category: 'W e i g h t',
                      displayNumber: weightValue.toString(),
                      measurementUnit: 'kg',
                      action: TextTypeBox(),
                    );
                  },
                ),
                SizedBox(width: 20),

                // Age
                ValueListenableBuilder(
                  valueListenable: age,
                  builder: (context, ageValue, child) {
                    return StatCard(
                      category: 'A g e',
                      displayNumber: ageValue.toString(),
                      measurementUnit: 'y/o',
                      action: IncrementDecrementButtons(
                        onDecrement: () {
                          age.value -= 1;
                        },
                        onIncrement: () {
                          age.value += 1;
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
              ],
            ),

            SizedBox(height: 30),
            // Calculate Button
            ValueListenableBuilder(
              valueListenable: bmi,
              builder: (context, bmiValue, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF80ed99),
                      minimumSize: Size(200, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    onPressed: () {
                      CalculateBMI();
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
        ),
      ),
    );
  }
}
