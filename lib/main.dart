import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/login_page.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: isDark ? Color(0XFF0d1b2a) : Color(0XFFedeec9),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFFb8f2e6))
          ),
          home: LoginPage(),
        );
      }
    );
  }
}
