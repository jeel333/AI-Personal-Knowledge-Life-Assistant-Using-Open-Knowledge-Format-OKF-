
import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0E1018);
  static const surface = Color(0xFF1B1E2B);
  static const surfaceLight = Color(0xFF252839);
  static const primary = Color(0xFFB18CFA);
  static const primaryDark = Color(0xFF7755C9);
  static const textPrimary = Color(0xFFF4F3FA);
  static const textSecondary = Color(0xFFA6A7B8);
  static const border = Color(0xFF343649);
}

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
