import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: Color.fromRGBO(30, 30, 63, 1),
    secondaryHeaderColor: Color.fromRGBO(255, 128, 57, 1),
    disabledColor: Color.fromRGBO(239, 240, 246, 1),
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Color.fromRGBO(30, 30, 63, 1)
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color.fromRGBO(30, 30, 63, 1)
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color.fromRGBO(102, 106, 123, 1)
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Colors.white
      ),
    )
  );

  static final ThemeData dark = ThemeData(
    primaryColor: Colors.white,
  );
}