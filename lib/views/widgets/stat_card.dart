import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String category;
  final String displayNumber;
  final String measurementUnit;
  final Widget action;
  const StatCard({
    super.key,
    required this.category,
    required this.displayNumber,
    required this.measurementUnit,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFb8f2e6),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: 155,
        width: 190,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Text(
                    displayNumber,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 3),
                  Text(measurementUnit),
                  SizedBox(height: 10),
                ],
              ),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
