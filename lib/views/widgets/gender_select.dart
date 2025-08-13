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
                GestureDetector(
                  onTap:() {
                    if(!male) isMale.value = !isMale.value;
                  },
                  child: Container(
                    height: 200,
                    width: 190,
                    decoration: BoxDecoration(
                      color: (male) ? Colors.blue.shade500: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
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
                GestureDetector(
                  onTap:() {
                    if(male) isMale.value = !isMale.value;
                  },
                  child: Container(
                    height: 200,
                    width: 190,
                    decoration: BoxDecoration(
                      color: (!male) ?  Colors.pink.shade200 : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
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
          }
        );
  }
}
