import 'dart:math';

import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isDarkMode.value)
          ? Colors.blueGrey.shade900
          : Colors.teal.shade50,
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 100,
        leading: TextButton.icon(
          label: Text('Back', style: TextStyle(fontSize: 15),),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('R E S U L T', style: TextStyle( fontSize: 30)),
        centerTitle: true,
      ),
      body: Column(
        
      ),
    );
  }
}
