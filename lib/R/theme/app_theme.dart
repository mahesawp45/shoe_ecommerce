import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class AppTheme {
  ThemeData getTheme({required bool isDark}) {
    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: isDark ? R.appColors.bgColor1 : Colors.white,
    );
  }
}
