import 'package:droidcon_app/user_interfaces/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.orangeColor
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(color: AppColors.blueColor),
      unselectedIconTheme: const IconThemeData(color: AppColors.blackColor),
      selectedItemColor: AppColors.orangeColor,
      unselectedItemColor: Colors.white
    ));
