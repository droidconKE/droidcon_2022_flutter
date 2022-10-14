import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../user_interfaces/colors/colors.dart';

final darkTheme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColors.blackColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.orangeColor
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.tealColor),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedItemColor: AppColors.orangeColor,
      unselectedItemColor: Colors.white
    ));