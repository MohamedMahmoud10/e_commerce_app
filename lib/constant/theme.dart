import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 19,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ));
ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 19,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w100,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ));
