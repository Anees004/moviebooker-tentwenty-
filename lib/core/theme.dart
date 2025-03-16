import 'package:flutter/material.dart';
import 'package:moviebooker/core/colors.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins', // Set default font
  scaffoldBackgroundColor: AppColors.lightBg,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  ),
); 