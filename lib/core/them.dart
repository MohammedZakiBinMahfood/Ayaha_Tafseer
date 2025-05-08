import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.white; // أخضر
  static const Color backgroundColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 16,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 14,
        color: Colors.black54,
      ),
    ),
  );
}
