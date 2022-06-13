import 'dart:io';
import 'package:intl/intl.dart';

class CustomLocaleHelper {
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    return format.currencyName ?? format.currencySymbol;
  }
}
