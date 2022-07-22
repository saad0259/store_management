import 'package:flutter/material.dart';

class CustomButtonTheme {
  CustomButtonTheme({
    required this.primaryColor,
    required this.accentColor,
    required this.primaryTextColor,
    required this.primaryTextColorLight,
  });
  final Color primaryTextColor;
  final Color primaryTextColorLight;
  final Color primaryColor;
  final Color accentColor;

  ButtonThemeData buttonTheme() => const ButtonThemeData(
        minWidth: double.infinity,
        padding: EdgeInsets.all(12.0),
      );

  TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
          textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 18,
              color: primaryTextColor,
              fontWeight: FontWeight.bold)),
          foregroundColor: MaterialStateProperty.all(
            primaryColor,
          ),
          shadowColor: MaterialStateProperty.all(
            primaryColor,
          ),
        ),
      );
  ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
          textStyle: MaterialStateProperty.all(
            TextStyle(
                fontSize: 18,
                color: primaryTextColor,
                fontWeight: FontWeight.bold),
          ),
          foregroundColor: MaterialStateProperty.all(accentColor),
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      );
}
