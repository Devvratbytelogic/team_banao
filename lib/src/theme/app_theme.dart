import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Inter', // Set Inter as the default font family

      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.normal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),

      // Typography
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.openSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.bodyText,
        ),
        headlineMedium: GoogleFonts.openSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyText,
        ),
        titleLarge: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyText,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.bodyText,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.bodyText,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.bodyText,
        ),
      ),

      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primary,
      ),
    );
  }
}


// ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️without google font⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️


// import 'package:flutter/material.dart';
// import '../core/constants.dart';
// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       primaryColor: AppColors.primary,
//       scaffoldBackgroundColor: Colors.white,
//       fontFamily: 'Poppins', // Optional: remove this line if you want full system default
//
//       // AppBar
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.secondary,
//         elevation: 0,
//         foregroundColor: Colors.white,
//       ),
//
//       // Buttons
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           foregroundColor: Colors.white,
//           textStyle: const TextStyle(
//             fontWeight: FontWeight.normal,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//       ),
//
//       // Typography
//       textTheme: const TextTheme(
//         headlineLarge: TextStyle(
//           fontSize: 32,
//           fontWeight: FontWeight.bold,
//           color: AppColors.bodyText,
//         ),
//         headlineMedium: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.w600,
//           color: AppColors.bodyText,
//         ),
//         titleLarge: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: AppColors.bodyText,
//         ),
//         bodyLarge: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//           color: AppColors.bodyText,
//         ),
//         bodyMedium: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.normal,
//           color: AppColors.bodyText,
//         ),
//         labelLarge: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: AppColors.bodyText,
//         ),
//       ),
//
//       colorScheme: ColorScheme.fromSwatch().copyWith(
//         secondary: AppColors.primary,
//       ),
//     );
//   }
// }
