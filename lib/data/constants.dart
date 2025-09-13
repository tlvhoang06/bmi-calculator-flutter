import 'package:demo/data/notifer.dart';

class KThemeModeKey{
  static String themeKey = 'themeKey';
}

int get primaryColor => isDarkMode.value ? 0XFFc0fdff : 0XFFffa5ab;