import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Colors color;
  const ActionButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          elevation: 3,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Recalculate",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
