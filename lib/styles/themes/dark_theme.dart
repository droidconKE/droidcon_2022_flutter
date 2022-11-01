import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors.dart';

final darkTheme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
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
        unselectedItemColor: Colors.white));
