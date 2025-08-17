import 'dart:math';

import 'package:demo/data/notifer.dart';
import 'package:demo/views/widgets/stat_attempt.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/widgets/gauge_chart.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isDarkMode.value)
          ? Colors.blueGrey.shade900
          : Color(0XFFedeec9),
      appBar: AppBar(
        backgroundColor: Color(0XFFedeec9),
        toolbarHeight: 0,
        leadingWidth: 100,
        title: Text('R E S U L T', style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Your result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 6,
                    color: isDarkMode.value ? Color(0XFFc0fdff) : Color(0XFF042a2b),
                  ),
                ),
                SizedBox(height: 40),
                StatusAndAttempt(),
                SizedBox(height: 50),
                Center(child: GaugeChart()),
                SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0XFFb8f2e6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            elevation: 3,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Recalculate",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0XFFb8f2e6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            elevation: 3,
                          ),
                          onPressed: () {
                            // TODO: Add function for second button
                          },
                          child: const Text(
                            "Save to History",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
