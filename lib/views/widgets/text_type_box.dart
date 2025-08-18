import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextTypeBox extends StatelessWidget {
  const TextTypeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 100,
      child: ValueListenableBuilder(
        valueListenable: isDarkMode,
        builder: (context, isDark, child) {
          return TextField(
            inputFormatters: [LengthLimitingTextInputFormatter(5)],
            onChanged: (value) {
              double? val = double.tryParse(value);
              if (val != null) {
                weight.value = val;
              }
            },
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: 'Enter here',
              hintStyle: TextStyle(
                fontSize: 15,
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
                borderSide: BorderSide(color: Colors.indigo.shade300, width: 2),
              ),
              filled: true,
              fillColor: Colors.blue.shade100,
            ),
            cursorHeight: 15,
          );
        },
      ),
    );
  }
}
