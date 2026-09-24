import 'package:flutter/material.dart';

class AppTheme {
  ThemeData Lighttheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
        background: Colors.white,
        primary: const Color.fromARGB(255, 52, 49, 215),
        secondary:Colors.black,
        tertiary: const Color.fromARGB(255, 178, 178, 178),
        
      ),
    );
  }

  ThemeData Darktheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 51, 28, 91),
        brightness: Brightness.dark,
        background: Colors.black,
        primary: const Color.fromARGB(255, 24, 0, 84),
        secondary: Colors.white,
        tertiary: const Color.fromARGB(255, 59, 59, 59),
      ),
    );
  }
}