import 'package:flutter/material.dart';

const primaryColor = Color(0xff9d2121);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
      );
}
