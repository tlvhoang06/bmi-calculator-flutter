import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final int color;
  final double radius;
  final double height;
  final double width;
  final VoidCallback action;
  const ActionButton({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.radius,
    required this.height,
    required this.width,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 3,
        ),
        onPressed: () {
          action();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
