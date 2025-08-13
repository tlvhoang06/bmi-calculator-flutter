import 'package:demo/data/notifer.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
        
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: (isDark) ? Brightness.dark : Brightness.light,)
          ),
          home: WidgetTree(),
        );
      }
    );
  }
}
