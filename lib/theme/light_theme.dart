import 'package:flutter/material.dart';
import 'my_app_colors.dart';
import 'text_theme.dart';
import 'input_theme.dart';
import 'button_theme.dart';

AppColors _appColors = AppColors();

Color primaryColor = _appColors.primaryColorLight;
Color accentColor = _appColors.accentColorLight;
Color primaryTextColor = _appColors.primaryTextColorLight;
Color primaryTextColor2 = _appColors.primaryTextColor2Light;
Color errorColor = _appColors.errorColorLight;

CustomButtonTheme _buttonTheme = CustomButtonTheme(
  primaryColor: primaryColor,
  accentColor: accentColor,
  primaryTextColor: primaryTextColor,
  primaryTextColorLight: _appColors.primaryTextColorLight,
);
CustomInputTheme _inputTheme = CustomInputTheme(
  primaryColor: primaryColor,
  accentColor: accentColor,
  primaryTextColor: primaryTextColor,
  primaryTextColorLight: _appColors.primaryTextColorLight,
);

ThemeData lightTheme(BuildContext context) => ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
          primary: primaryColor, secondary: accentColor, error: errorColor),
      primaryColor: primaryColor,
      errorColor: errorColor,
      brightness: Brightness.light,
      primaryColorLight: Colors.blue.shade100,
      cardColor: accentColor,
      scaffoldBackgroundColor: Colors.white.withAlpha(250),
      fontFamily: 'Ubuntu',
      textTheme:
          ThemeData.light().textTheme.merge(customTextTheme(primaryTextColor)),
      iconTheme: IconThemeData(color: primaryColor),
      textButtonTheme: _buttonTheme.textButtonThemeData(),
      buttonTheme: _buttonTheme.buttonTheme(),
      elevatedButtonTheme: _buttonTheme.elevatedButtonThemeData(),
      inputDecorationTheme: _inputTheme.customInputTheme(),
    );
