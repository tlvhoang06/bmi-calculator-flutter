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
            scaffoldBackgroundColor: isDark ? Color(0XFF0d1b2a) : Color(0XFFedeec9),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFFdde7c7))
          ),
          home: WidgetTree(),
        );
      }
    );
  }
}
