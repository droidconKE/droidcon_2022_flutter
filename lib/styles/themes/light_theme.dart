import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

final lightTheme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.orangeColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: AppColors.blueColor),
        unselectedIconTheme: IconThemeData(color: AppColors.blackColor),
        selectedItemColor: AppColors.orangeColor,
        unselectedItemColor: Colors.white));
