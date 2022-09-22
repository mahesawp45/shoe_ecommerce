import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/R/r.dart';

class AppTextStyle {
  final TextStyle primaryTextStyle =
      GoogleFonts.montserrat(color: R.appColors.primaryTextColor);

  final TextStyle secondaryTextStyle =
      GoogleFonts.montserrat(color: R.appColors.secondaryTextColor);

  final TextStyle priceTextStyle =
      GoogleFonts.montserrat(color: R.appColors.priceColor);

  final TextStyle darkTextStyle =
      GoogleFonts.montserrat(color: R.appColors.darkTextColor);

  final TextStyle blueTextStyle =
      GoogleFonts.montserrat(color: R.appColors.blueTextColor);
}
