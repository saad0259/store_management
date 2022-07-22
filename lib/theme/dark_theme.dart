import 'package:flutter/material.dart';
import 'my_app_colors.dart';
import 'text_theme.dart';
import 'input_theme.dart';
import 'button_theme.dart';

AppColors _appColors = AppColors();

Color primaryColor = _appColors.primaryColorDark;
Color accentColor = _appColors.accentColorDark;
Color primaryTextColor = _appColors.primaryTextColorDark;
Color primaryTextColorLight = _appColors.primaryTextColor2Dark;
Color errorColor = _appColors.errorColorDark;

CustomButtonTheme _buttonTheme = CustomButtonTheme(
  primaryColor: primaryColor,
  accentColor: accentColor,
  primaryTextColor: primaryTextColor,
  primaryTextColorLight: primaryTextColorLight,
);
CustomInputTheme _inputTheme = CustomInputTheme(
  primaryColor: primaryColor,
  accentColor: accentColor,
  primaryTextColor: primaryTextColor,
  primaryTextColorLight: primaryTextColorLight,
);

ThemeData darkTheme(BuildContext context) => ThemeData(
      colorScheme: const ColorScheme.dark()
          .copyWith(primary: primaryColor, secondary: accentColor),
      primaryColor: primaryColor,
      errorColor: errorColor,
      brightness: Brightness.dark,
      primaryColorLight: Colors.blue.shade900,
      cardColor: accentColor,
      scaffoldBackgroundColor: Colors.black87,
      fontFamily: 'Ubuntu',
      textTheme:
          ThemeData.dark().textTheme.merge(customTextTheme(primaryTextColor)),
      iconTheme: const IconThemeData(color: Colors.blue),
      textButtonTheme: _buttonTheme.textButtonThemeData(),
      buttonTheme: _buttonTheme.buttonTheme(),
      elevatedButtonTheme: _buttonTheme.elevatedButtonThemeData(),
      inputDecorationTheme: _inputTheme.customInputTheme(),
    );
