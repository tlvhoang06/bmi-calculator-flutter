import 'package:flutter/material.dart';

class IncrementDecrementButtons extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const IncrementDecrementButtons({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onDecrement,
          child: Text(
            '—',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: onIncrement,
          child: Text(
            '+',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
