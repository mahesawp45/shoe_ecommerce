import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/R/r.dart';

class AppTheme {
  ThemeData getTheme({required bool isDark}) {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: isDark ? R.appColors.bgColor3 : Colors.white,
    );
  }
}
