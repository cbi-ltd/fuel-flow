import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  // primary
  static const Color primary = Color(0xFFAE0C00); //cbi-red
  static const Color primaryLight = Color(0xFFFFF1F0); //cbi-red-light

  // neutral
  static const Color background = Color(0xFFFFFAFA);
  static const Color border = Color(0xFFEDEDED);
  static const Color ring = Color(0xFFAE0C00);
  static const Color surface = Color(0xFFFFFFFF);

  // text
  static const Color textPrimary = Color(0xFFAE0C00);
  static const Color textSecondary = Color(0xFF333333);
  static const Color textWhite = Color(0xFFFFFFFF);

  // header
  static const Color header = Color(0xFFF6F6F6);

  // card
  static const Color card = Color(0xFFFFFAFA);
  static const Color cardBorder = Color(0xFFF1F1F1);

  // status
  static const Color success = Color(0xFFEFFFF7);
  static const Color textSuccess = Color(0xFF32B873);
  static const Color pending = Color(0xFFFFFBF4);
  static const Color textPending = Color(0xFFEDC594);
  static const Color failed = Color(0xFFFFF4F4);
  static const Color textFailed = Color(0xFFC07474);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Avenir',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.background,
        error: AppColors.textFailed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.header,
        foregroundColor: AppColors.textSecondary,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(
          fontFamily: 'Avenir',
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textWhite,
          minimumSize: const Size(double.infinity, 58),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          textStyle: const TextStyle(
            fontFamily: 'Avenir',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.ring, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.textFailed, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.textFailed, width: 1),
        ),
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontFamily: 'Avenir',
          fontSize: 24,
          letterSpacing: 0.5,
        ),
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontFamily: 'Avenir',
          fontSize: 16,
        ),
        errorStyle: const TextStyle(
          color: AppColors.textFailed,
          fontFamily: 'Avenir',
          fontSize: 12,
        ),
      ),
    );
  }
}
