import 'package:flutter/material.dart';

class L10n {
  List<Locale> all;

  L10n()
      : all = const [
          Locale('en'),
          Locale('ur'),
        ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'ur':
        return '🇵🇰';
      default:
        return '🇺🇸';
    }
  }
}
