import 'package:flutter/material.dart';

Widget customElevatedButton(BuildContext context,
    {required VoidCallback onPressed,
    required String text,
    bool isAccent = false}) {
  return ElevatedButton(
    style: isAccent
        ? ElevatedButtonTheme.of(context).style?.copyWith(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
            )
        : null,
    onPressed: onPressed,
    child: Text(text),
  );
}
