// # App-wide constants (colors, strings)
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF014B87);
  static const Color secondary = Color(0xFFF59A1B);
  static const Color danger = Color(0xFFD2402C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bodyText = Color(0xFF2E3A59);
  static const Color lightGray = Color(0xFFD9D9D9);
  // static const Color secondary = Color(0xFFF4B544);
  // static const Color batBrownLight = Color(0xFFE09C58);
  // static const Color batBrownDark = Color(0xFFA35D29);
}

class AppStrings {
  static const appName = "Team Banao";
}

class AppContainers {
  static const double horizontalPadding = 20.0;
  static const double verticalPadding = 20.0;
  static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(horizontal: horizontalPadding);
  static const EdgeInsets screenPaddingVertical = EdgeInsets.symmetric(vertical: verticalPadding);
}

class AppSpaces {
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);

  static const SizedBox w1 = SizedBox(width: 1);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w32 = SizedBox(width: 32);
}