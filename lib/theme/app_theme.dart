import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Parabolica'),
        titleMedium: TextStyle(fontFamily: 'Gelica'),
      ),
    );
  }
}
