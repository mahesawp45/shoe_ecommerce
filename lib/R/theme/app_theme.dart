import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/R/r.dart';

class AppTheme {
  ThemeData getTheme({required bool isDark}) {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.montserratTextTheme(),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        surfaceTintColor: R.appColors.bgColor3.withOpacity(0.55),
        color: R.appColors.bgColor3.withOpacity(0.55),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: isDark ? R.appColors.bgColor3 : Colors.white,
    );
  }
}
