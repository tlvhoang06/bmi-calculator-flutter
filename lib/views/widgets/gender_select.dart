import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';

class GenderSelect extends StatelessWidget {
  const GenderSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isMale,
      builder: (context, male, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Male
            Ink(
              height: 230,
              width: 190,
              decoration: BoxDecoration(
                color: (male) ? Color(0XFF72ddf7) : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: InkWell(
                onTap: () {
                  if (!male) isMale.value = !isMale.value;
                },
                borderRadius: BorderRadius.circular(22),
                splashColor: Colors.blue.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male, size: 100),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),

            // Female
            Ink(
              height: 230,
              width: 190,
              decoration: BoxDecoration(
                color: (!male) ? Color(0XFFffa5ab) : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: InkWell(
                onTap: () {
                  if (male) isMale.value = !isMale.value;
                },
                borderRadius: BorderRadius.circular(22),
                splashColor: Colors.pink.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.female, size: 100),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
