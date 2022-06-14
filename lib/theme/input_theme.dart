import 'package:flutter/material.dart';

class CustomInputTheme {
  CustomInputTheme({
    required this.primaryColor,
    required this.accentColor,
    required this.primaryTextColor,
    required this.primaryTextColorLight,
  });
  final Color primaryTextColor;
  final Color primaryTextColorLight;
  final Color primaryColor;
  final Color accentColor;

  InputDecorationTheme customInputTheme() => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15.0),
        fillColor: accentColor,
        filled: true,
        // focusColor: primaryTextColorLight,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: primaryTextColorLight),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: primaryColor),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: primaryTextColorLight),
        ),
      );
}
