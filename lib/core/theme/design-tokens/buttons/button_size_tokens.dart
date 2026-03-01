import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Button Type Enum
/// Differentiates between text buttons (with labels) and icon-only buttons
enum ButtonType { text, icon }

/// Button Size Tokens
/// Defines size-specific properties for buttons (padding, border radius)
/// Supports both text buttons and icon-only buttons through factory constructors
class ButtonSizeTokens {
  final EdgeInsets padding;
  final double borderRadius;

  const ButtonSizeTokens({
    required this.padding,
    required this.borderRadius,
  });

  /// Giant button size
  /// Text: 24px horizontal, 16px vertical | Icon: 16px all
  /// Border radius: 12px
  factory ButtonSizeTokens.giant(ButtonType type) {
    return type == ButtonType.text
        ? ButtonSizeTokens(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      borderRadius: 12.r,
    )
        : ButtonSizeTokens(
      padding: EdgeInsets.all(16.w),
      borderRadius: 12.r,
    );
  }

  /// Large button size
  /// Text: 20px horizontal, 14px vertical | Icon: 12px all
  /// Border radius: 12px
  factory ButtonSizeTokens.large(ButtonType type) {
    return type == ButtonType.text
        ? ButtonSizeTokens(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      borderRadius: 12.r,
    )
        : ButtonSizeTokens(
      padding: EdgeInsets.all(12.w),
      borderRadius: 12.r,
    );
  }

  /// Medium button size
  /// Text: 16px horizontal, 12px vertical | Icon: 8px all
  /// Border radius: 12px
  factory ButtonSizeTokens.medium(ButtonType type) {
    return type == ButtonType.text
        ? ButtonSizeTokens(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      borderRadius: 12.r,
    )
        : ButtonSizeTokens(
      padding: EdgeInsets.all(8.w),
      borderRadius: 12.r,
    );
  }

  /// Small button size
  /// Text: 12px horizontal, 8px vertical | Icon: 4px all
  /// Border radius: 8px
  factory ButtonSizeTokens.small(ButtonType type) {
    return type == ButtonType.text
        ? ButtonSizeTokens(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      borderRadius: 8.r,
    )
        : ButtonSizeTokens(
      padding: EdgeInsets.all(4.w),
      borderRadius: 8.r,
    );
  }

  /// Tiny button size
  /// Text: 8px horizontal, 6px vertical | Icon: 4px all
  /// Border radius: 8px
  factory ButtonSizeTokens.tiny(ButtonType type) {
    return type == ButtonType.text
        ? ButtonSizeTokens(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      borderRadius: 8.r,
    )
        : ButtonSizeTokens(
      padding: EdgeInsets.all(4.w),
      borderRadius: 8.r,
    );
  }
}