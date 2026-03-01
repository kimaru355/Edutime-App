import 'package:flutter/material.dart';
import 'package:edutime/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Button State Colors
/// Defines colors for a specific button state
class ButtonStateColors {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;

  const ButtonStateColors({
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
  });
}

/// Button Variant Colors
/// Defines colors for all states of a button variant
class ButtonVariantColors {
  final ButtonStateColors defaultColors;
  final ButtonStateColors pressedColors;
  final ButtonStateColors disabledColors;

  const ButtonVariantColors({
    required this.defaultColors,
    required this.pressedColors,
    required this.disabledColors,
  });
}

/// Button Color Tokens
/// Contains color definitions for all button variants (filled, outlined, clear)
/// Supports light and dark themes using BuildContext
class ButtonColorTokens {
  final BuildContext context;

  ButtonColorTokens(this.context);

  /// Check if current theme is dark
  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  /// Get current theme
  ThemeData get _theme => Theme.of(context);

  /// Filled button colors
  /// Default: Primary background with white text
  /// Pressed: Darker primary background
  /// Disabled: Gray background with muted text
  ButtonVariantColors get filled => ButtonVariantColors(
    defaultColors: ButtonStateColors(
      backgroundColor: _theme.primaryColor,
      foregroundColor: AppColors.white,
    ),
    pressedColors: ButtonStateColors(
      backgroundColor: _theme.primaryColorDark,
      foregroundColor: AppColors.white,
    ),
    disabledColors: ButtonStateColors(
      backgroundColor: _isDark ? AppColors.gray700 : AppColors.gray200,
      foregroundColor: _isDark ? AppColors.gray600 : AppColors.gray400,
    ),
  );

  /// Outlined button colors
  /// Default: Transparent background with primary border and text
  /// Pressed: Light primary background with darker border
  /// Disabled: Gray border with muted text
  ButtonVariantColors get outlined => ButtonVariantColors(
    defaultColors: ButtonStateColors(
      backgroundColor: Colors.transparent,
      foregroundColor: _theme.primaryColor,
      borderColor: _theme.primaryColor,
    ),
    pressedColors: ButtonStateColors(
      backgroundColor: _isDark ? AppColors.primary900 : AppColors.primary50,
      foregroundColor: _isDark ? AppColors.primary300 : AppColors.primary700,
      borderColor: _isDark ? AppColors.primary300 : AppColors.primary700,
    ),
    disabledColors: ButtonStateColors(
      backgroundColor: Colors.transparent,
      foregroundColor: _isDark ? AppColors.gray600 : AppColors.gray400,
      borderColor: _isDark ? AppColors.gray700 : AppColors.gray200,
    ),
  );

  /// Clear/Text button colors
  /// Default: Transparent background with primary text
  /// Pressed: Light primary background with darker text
  /// Disabled: Transparent background with muted text
  ButtonVariantColors get clear => ButtonVariantColors(
    defaultColors: ButtonStateColors(
      backgroundColor: Colors.transparent,
      foregroundColor: _theme.primaryColor,
    ),
    pressedColors: ButtonStateColors(
      backgroundColor: _isDark ? AppColors.primary900 : AppColors.primary50,
      foregroundColor: _isDark ? AppColors.primary300 : AppColors.primary700,
    ),
    disabledColors: ButtonStateColors(
      backgroundColor: Colors.transparent,
      foregroundColor: _isDark ? AppColors.gray600 : AppColors.gray400,
    ),
  );

  /// Border width for outlined buttons
  static double outlinedBorderWidth = 1.5.w;

  /// Spacing between icon and text
  static double iconTextSpacing = 8.w;
}