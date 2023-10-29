import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 5, 109, 151),
            onPrimary: Color.fromARGB(255, 238, 255, 254),
            secondary: Color.fromARGB(255, 55, 61, 171),
            onSecondary: Colors.indigoAccent,
            error: Color.fromARGB(255, 191, 83, 83),
            onError: Colors.white,
            background: Color.fromARGB(255, 247, 255, 237),
            onBackground: Colors.black,
            surface: Color.fromARGB(255, 168, 162, 255),
            onSurface: Colors.black));
  }
}
