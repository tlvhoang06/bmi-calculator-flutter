import 'package:demo/data/constants.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback action;
  const AuthButton({super.key, required this.action, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FilledButton(
        onPressed: () {
          action;
        },
        style: FilledButton.styleFrom(
          elevation: 3,
          minimumSize: Size(double.infinity, 40),
          backgroundColor: Color(primaryColor),
          foregroundColor: Colors.black,
        ),
        child: Text(buttonText),
      ),
    );
  }
}
