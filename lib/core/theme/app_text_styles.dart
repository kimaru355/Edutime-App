import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App Text Styles
/// Contains all text style definitions for the application using Nunito font
class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Nunito';

  // ==================== HEADINGS ====================

  /// Heading 1 - Extra Bold (34px, weight: 800)
  static TextStyle heading1ExtraBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 34.sp,
    fontWeight: FontWeight.w800,
    height: 1.2, // line height
    letterSpacing: -0.68,
  );

  /// Heading 1 - Bold (34px, weight: 700)
  static TextStyle heading1Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.68,
  );

  /// Heading 2 - Extra Bold (28px, weight: 800)
  static TextStyle heading2ExtraBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
    height: 1.25,
    letterSpacing: -0.28,
  );

  /// Heading 2 - Bold (28px, weight: 700)
  static TextStyle heading2Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.28,
  );

  // ==================== TITLES ====================

  /// Title 1 - Extra Bold (24px, weight: 800)
  static TextStyle title1ExtraBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    height: 1.3,
    letterSpacing: -0.24,
  );

  /// Title 1 - Bold (24px, weight: 700)
  static TextStyle title1Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: -0.24,
  );

  /// Title 1 - Semi Bold (24px, weight: 600)
  static TextStyle title1SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.24,
  );

  /// Title 2 - Extra Bold (20px, weight: 800)
  static TextStyle title2ExtraBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    height: 1.35,
    letterSpacing: 0,
  );

  /// Title 2 - Bold (20px, weight: 700)
  static TextStyle title2Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
    letterSpacing: 0,
  );

  /// Title 2 - Semi Bold (20px, weight: 600)
  static TextStyle title2SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
  );

  // ==================== BODY ====================

  /// Body 1 - Semi Bold (17px, weight: 600)
  static TextStyle body1SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0,
  );

  /// Body 1 - Medium (17px, weight: 500)
  static TextStyle body1Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0,
  );

  /// Body 1 - Regular (17px, weight: 400)
  static TextStyle body1Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0,
  );

  /// Body 2 - Semi Bold (15px, weight: 600)
  static TextStyle body2SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.15,
  );

  /// Body 2 - Medium (15px, weight: 500)
  static TextStyle body2Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.15,
  );

  /// Body 2 - Regular (15px, weight: 400)
  static TextStyle body2Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0.15,
  );

  /// Body 3 - Semi Bold (13px, weight: 600)
  static TextStyle body3SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    height: 1.42,
    letterSpacing: 0.26,
  );

  /// Body 3 - Medium (13px, weight: 500)
  static TextStyle body3Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    height: 1.42,
    letterSpacing: 0.26,
  );

  /// Body 3 - Regular (13px, weight: 400)
  static TextStyle body3Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    height: 1.42,
    letterSpacing: 0.26,
  );

  // ==================== CAPTION ====================

  /// Caption - Bold (12px, weight: 700)
  static TextStyle captionBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    height: 1.33,
    letterSpacing: 0.36,
  );

  /// Caption - Semi Bold (12px, weight: 600)
  static TextStyle captionSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.36,
  );

  /// Caption - Medium (12px, weight: 500)
  static TextStyle captionMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.36,
  );

  // ==================== SUBTITLE ====================

  /// Subtitle - Bold (17px, weight: 700)
  static TextStyle subtitleBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    height: 1.45,
    letterSpacing: 0,
  );

  /// Subtitle - Semi Bold (17px, weight: 600)
  static TextStyle subtitleSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0,
  );

  /// Subtitle - Medium (17px, weight: 500)
  static TextStyle subtitleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0,
  );

  // ==================== CTA (Call to Action) ====================

  /// CTA Button - Semi Bold (16px, weight: 600)
  static TextStyle ctaButtonSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
  );

  /// CTA Button - Medium (16px, weight: 500)
  static TextStyle ctaButtonMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
  );

  /// CTA Link - Semi Bold (14px, weight: 600)
  static TextStyle ctaLinkSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.42,
    letterSpacing: 0.21,
  );

  /// CTA Link - Medium (14px, weight: 500)
  static TextStyle ctaLinkMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.42,
    letterSpacing: 0.21,
  );

  // ==================== CHIP ====================

  /// Chip 10 - Semi Bold (10px, weight: 600)
  static TextStyle chip10SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.5,
  );

  /// Chip 10 - Medium (10px, weight: 500)
  static TextStyle chip10Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
  );

  /// Chip 10 - Regular (10px, weight: 400)
  static TextStyle chip10Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.5,
  );

  /// Chip 11 - Semi Bold (11px, weight: 600)
  static TextStyle chip11SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.44,
  );

  /// Chip 11 - Medium (11px, weight: 500)
  static TextStyle chip11Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.44,
  );

  /// Chip 11 - Regular (11px, weight: 400)
  static TextStyle chip11Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0.44,
  );
}