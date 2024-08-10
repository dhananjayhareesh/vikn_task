import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_task/utils/constants/colors.dart';

class AppText {
  // static TextStyle get averageWhite => const TextStyle(
  //     fontSize: 11.5,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: 'Poppins',
  //     color: AppColors.whiteColor,
  //     overflow: TextOverflow.ellipsis);

  static TextStyle get averageWhite => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      );

  static TextStyle get smallWhite => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      );
  static TextStyle get grey => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.greyColor,
      );
  static TextStyle get smallBlue => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.blueColor,
      );
  static TextStyle get smallGreen => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.greenColor,
      );

  static TextStyle get smallGrey => GoogleFonts.poppins(
        fontSize: 13,
        color: AppColors.greyColor,
      );
}
