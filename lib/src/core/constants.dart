// # App-wide constants (colors, strings)
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF014B87);
  static const Color secondary = Color(0xFFF59A1B);
  static const Color danger = Color(0xFFD2402C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bodyText = Color(0xFF2E3A59);
  static const Color lightGray = Color(0xFFD9D9D9);
  static const Color transparent = Colors.transparent; // ✅ NEW

  // static const Color secondary = Color(0xFFF4B544);
  // static const Color batBrownLight = Color(0xFFE09C58);
  // static const Color batBrownDark = Color(0xFFA35D29);



  // LinearGradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF014B87),
      Color(0xFF0370BD),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


  static const LinearGradient lightPrimaryGradient = LinearGradient(
    colors: [
      Color(0xFF5FA1D6),
      Color(0xFFA3CDEB),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightSecondaryGradient = LinearGradient(
    colors: [
      Color(0xFFFFD180),
      Color(0xFFFFE9B2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primarySecondaryGradient = LinearGradient(
    colors: [
      Color(0xFF014B87), // Primary Blue
      Color(0xFF0370BD), // Mid Blue
      Color(0xFFF59A1B), // Secondary Orange
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightPrimarySecondaryGradient = LinearGradient(
    colors: [
      Color(0xFF5FA1D6), // Lightened Primary
      Color(0xFFA3CDEB), // Extra light blue
      Color(0xFFFFD180), // Lightened Secondary
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blendedPrimarySecondaryGradient = LinearGradient(
    colors: [
      Color(0xFF014B87), // Primary
      Color(0xFF4B85A9), // Muted Blue-Orange Mix
      Color(0xFFF59A1B), // Secondary
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


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
  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h44 = SizedBox(height: 44);
  static const SizedBox h64 = SizedBox(height: 64);
  static const SizedBox h82 = SizedBox(height: 82);
  static const SizedBox h90 = SizedBox(height: 90);
  static const SizedBox h100 = SizedBox(height: 100);

  static const SizedBox w1 = SizedBox(width: 1);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w32 = SizedBox(width: 32);
}