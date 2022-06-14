import 'package:flutter/material.dart';

class CustomFormHelper {
  void unfocusFormFields(BuildContext context) {
    try {
      FocusScope.of(context).unfocus();
      Focus.of(context).unfocus();
    } catch (_) {}
  }
}
