import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'string_extension.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toString().capitalize(),
      selection: newValue.selection,
    );
  }
}

@Deprecated('This formatter does not work.')
class PriceCommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      // text: newValue.text.toString().priceCommas(),
      text: NumberFormat('#,##,000').format(newValue),
      selection: newValue.selection,
    );
  }
}
