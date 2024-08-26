import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    primaryColor: AppColors.blackColor,
    canvasColor: AppColors.blackColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.blackColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 1,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.lightGreyColor),
    textTheme: TextTheme(
      labelMedium: GoogleFonts.inter(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w400),

      labelSmall: GoogleFonts.inter(
          color: AppColors.lightGreyColor,
          fontSize: 15,
          fontWeight: FontWeight.w400),

      displayLarge: GoogleFonts.inter(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),

      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
        fontSize: 22,
      ),
      titleLarge:  GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
        fontSize: 24,
      ),
        displaySmall: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            color: AppColors.lightGreyColor,
            fontSize: 10),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400),
        titleMedium: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGreyColor)),
  );
}
