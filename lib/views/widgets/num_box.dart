import 'package:flutter/material.dart';

class NumBox extends StatelessWidget {
  final Widget child;
  const NumBox({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 190,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: Color(0XFFb8f2e6),),
      child: Center(child: child)
    );
  }
}