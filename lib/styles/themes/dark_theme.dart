import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';
import 'light_theme.dart';

final darkTheme = lightTheme.copyWith(
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      titleLarge: GoogleFonts.montserratTextTheme().titleLarge?.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppColors.blueColor,
          ),
      titleMedium: GoogleFonts.montserratTextTheme().titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.lightGreyTextColor),
      titleSmall: GoogleFonts.montserratTextTheme().titleSmall?.copyWith(
            fontSize: 17,
          ),
      bodyLarge: GoogleFonts.montserratTextTheme().bodyLarge?.copyWith(
            fontSize: 16,
          ),
      bodyMedium: GoogleFonts.montserratTextTheme().bodyMedium?.copyWith(
            fontSize: 14,
            color: AppColors.lightGreyTextColor,
          ),
      bodySmall: GoogleFonts.montserratTextTheme().bodySmall?.copyWith(
            fontSize: 13,
          ),
      labelLarge: GoogleFonts.montserratTextTheme().labelLarge?.copyWith(
            fontSize: 12,
            color: AppColors.greyTextColor,
          ),
      labelMedium: GoogleFonts.montserratTextTheme().labelMedium?.copyWith(
            fontSize: 11,
            color: AppColors.greyTextColor,
          ),
      labelSmall: GoogleFonts.montserratTextTheme().labelSmall?.copyWith(
            fontSize: 10,
            color: AppColors.greyTextColor,
          ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppColors.blackColor,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.orangeColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.tealColor),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedItemColor: AppColors.orangeColor,
      unselectedItemColor: Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: lightTheme.textTheme.bodyMedium?.copyWith(
        color: AppColors.greyTextColor,
      ),
    ));
