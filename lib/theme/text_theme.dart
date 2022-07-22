import 'package:flutter/material.dart';

TextTheme customTextTheme(Color primaryTextColor) {
  return TextTheme(
    bodyText1: TextStyle(
      color: primaryTextColor.withAlpha(150),
      // fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: primaryTextColor.withAlpha(150),
      // fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      // fontSize: 12,
      color: primaryTextColor,
    ),
    headline5: TextStyle(
      // fontSize: 14,
      color: primaryTextColor,
    ),
    headline4: TextStyle(
      // fontSize: 16,
      color: primaryTextColor,
    ),
    headline3: TextStyle(
      // fontSize: 18,
      color: primaryTextColor,
      fontWeight: FontWeight.w900,
    ),
    headline2: TextStyle(
      // fontSize: 24,
      color: primaryTextColor,
      fontWeight: FontWeight.w900,
    ),
    headline1: TextStyle(
      // fontSize: 28,
      color: primaryTextColor,
      fontWeight: FontWeight.w900,
    ),
  );
}
