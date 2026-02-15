import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App Theme
/// Contains light and dark theme configurations for the application
class AppTheme {
  AppTheme._();

  // ==================== LIGHT THEME ====================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,

      // Primary colors
      primaryColor: AppColors.primary500,
      primaryColorLight: AppColors.primary300,
      primaryColorDark: AppColors.primary700,

      // Scaffold
      scaffoldBackgroundColor: AppColors.primary25,
      canvasColor: AppColors.white,

      // Card color
      cardColor: AppColors.white,

      // Divider color
      dividerColor: AppColors.gray300,

      // Disabled color
      disabledColor: AppColors.gray200,

      // Hint color
      hintColor: AppColors.gray400,
    );
  }

  // ==================== DARK THEME ====================

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,

      // Primary colors
      primaryColor: AppColors.primary500,
      primaryColorLight: AppColors.primary300,
      primaryColorDark: AppColors.primary700,

      // Scaffold
      scaffoldBackgroundColor: AppColors.gray950,
      canvasColor: AppColors.gray800,

      // Card color
      cardColor: AppColors.gray800,

      // Divider color
      dividerColor: AppColors.gray600,

      // Disabled color
      disabledColor: AppColors.gray700,

      // Hint color
      hintColor: AppColors.gray500,
    );
  }
}