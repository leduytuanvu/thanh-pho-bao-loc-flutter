import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle titleS1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleS2 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleS3 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleS4 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 44.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleS5 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 60.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyS1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: AppColors.dark5,
    fontSize: 13.sp,
  );
  static TextStyle bodyS2 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 17.sp,
  );
  static TextStyle bodyS3 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 20.sp,
  );
  static TextStyle bodyS4 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 25.sp,
  );
  static TextStyle bodyS5 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    color: Colors.white,
    fontSize: 30.sp,
  );

  static TextStyle button = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
  );
}
