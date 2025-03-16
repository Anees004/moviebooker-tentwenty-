import 'package:flutter/material.dart';

class AppColors {
  static const Color darkPurple = Color(0xFF2C2A3A);
  static const Color lightPurple = Color(0xFFEDEEF2);
  static const Color grey = Color(0xFF8B8B9A);
  static const Color lightBlue = Color(0xFF61C3F2);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color teal = Color(0xFF4DB6AC);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF673AB7);
  static const Color gold = Color(0xFFD4AF37);
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF202C43);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBg = Color(0xFFF6F6FA);

  // Define seat type colors
  static Map<int, Color> seatTypeColors = {
    0: AppColors.grey, // Unavailable seats
    1: AppColors.lightBlue, // Standard seats
    2: AppColors.gold, // Special reserved seat
    3: AppColors.purple, // VIP seats
  };
}
