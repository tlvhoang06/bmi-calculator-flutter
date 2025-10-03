import 'package:demo/data/notifer.dart';
import 'package:demo/services/database_service.dart';
import 'package:demo/views/widgets/buttons/action_buttons.dart';
import 'package:demo/views/functions/stat_attempt.dart';
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
                    color: isDarkMode.value
                        ? Color(0XFFc0fdff)
                        : Color(0XFF042a2b),
                  ),
                ),
                SizedBox(height: 40),
                StatusAndAttempt(),
                SizedBox(height: 50),
                Center(child: GaugeChart()),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                        text: 'Recalculate',
                        fontSize: 18,
                        color: 0XFFb8f2e6,
                        radius: 22,
                        height: 100,
                        width: 180,
                        action: () {
                          Navigator.pop(context);
                        },
                      ),
                      ActionButton(
                        text: 'Save to History',
                        fontSize: 18,
                        color: 0XFFb8f2e6,
                        radius: 22,
                        height: 100,
                        width: 180,
                        action: () async {
                          await DatabaseService().saveResult(bmi.value);
                          final snapshot = await DatabaseService().firestore
                              .collection("user")
                              .doc(DatabaseService().uid)
                              .collection("bmiResults")
                              .orderBy("time")
                              .get();
                          if (snapshot.docs.length > 15) {
                            await DatabaseService().deleteResult(
                              snapshot.docs.first.id,
                            );
                          }
                        },
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
