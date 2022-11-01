import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    titleLarge: GoogleFonts.montserratTextTheme().titleLarge?.copyWith(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: AppColors.blueColor,
        ),
    titleMedium: GoogleFonts.montserratTextTheme().titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
    titleSmall: GoogleFonts.montserratTextTheme().titleSmall?.copyWith(
          fontSize: 17,
        ),
    bodyLarge: GoogleFonts.montserratTextTheme().bodyLarge?.copyWith(
          fontSize: 16,
        ),
    bodyMedium: GoogleFonts.montserratTextTheme().bodyMedium?.copyWith(
          fontSize: 14,
        ),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.white,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.orangeColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(color: AppColors.blueColor),
    unselectedIconTheme: IconThemeData(color: AppColors.blackColor),
    selectedItemColor: AppColors.orangeColor,
    unselectedItemColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: AppColors.lightGrayBackgroundColor),
    ),
    hintStyle: const TextStyle(
      color: AppColors.lightGreyTextColor,
      fontWeight: FontWeight.w100,
      fontSize: 14,
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide:
            const BorderSide(color: AppColors.lightGrayBackgroundColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: AppColors.blueDroidconColor)),
    fillColor: AppColors.lightGrayBackgroundColor,
    filled: true,
  ),
);
