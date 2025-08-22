import 'package:demo/data/constants.dart';
import 'package:demo/data/notifer.dart';
import 'package:demo/views/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  void initState(){
    super.initState();
    initThemeMode();
  }
  void initThemeMode() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? savedTheme = prefs.getBool(KThemeModeKey.themeKey);
    isDarkMode.value = savedTheme ?? false;
  }
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
          home: AuthGate(),
        );
      }
    );
  }
}
