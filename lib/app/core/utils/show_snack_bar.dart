import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';

void showSnackBar({BuildContext? context, String? message, Color? color}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      elevation: 5,
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      content: Text(
        message!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
