import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    ThemeData theme = ThemeData(
      primarySwatch: Colors.green,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );

    return theme;
  }
}
