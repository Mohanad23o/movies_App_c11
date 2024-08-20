import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
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
    ),
  );
}
