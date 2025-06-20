import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // primaryColor: AppColors.primary,
      // scaffoldBackgroundColor: Colors.white,
      // fontFamily: 'lora', // Set Inter as the default font family

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),

      // Typography
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.ubuntu(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.bodyText,
        ),
        headlineMedium: GoogleFonts.ubuntu(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyText,
        ),
        headlineSmall: GoogleFonts.ubuntu(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyText,
        ),
        titleLarge: GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyText,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.secondary,
        ),
        bodyMedium: GoogleFonts.inter( //// the default text style for plain Text widgets that don’t specify a style explicitly.
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


      // Input decoration styling
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.inter(
          fontSize: 16,
          color: AppColors.bodyText,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(  // <--- add this
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightGray, // or your preferred color for unfocused border
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        suffixIconColor: AppColors.primary,  // sets suffix icon color
        prefixIconColor: AppColors.primary, // sets prefix icon color
      ),

      // Text button decoration and styling
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        )
              .copyWith(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
      ),


      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primary,
      ),
    );
  }
}