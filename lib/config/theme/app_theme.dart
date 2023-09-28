import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff9d2121);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates(),
          titleMedium: GoogleFonts.montserratAlternates(fontSize: 25),
        ),
      );
}
