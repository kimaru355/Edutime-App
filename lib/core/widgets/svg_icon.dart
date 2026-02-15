import 'package:edutime/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// SvgIcon Widget
/// A reusable widget for displaying SVG icons with customizable color and size
class SvgIcon extends StatelessWidget {
  ///Path to the SVG asset file (e.g., 'assets/icons/home.svg')
  final String assetPath;

  /// Optional color to apply to the SVG icon
  /// If not provided, defaults to [AppColors.gray600] for light mode and [AppColors.gray400] for dark mode
  final Color? color;

  /// Optional size for the SVG
  /// Applies to both width and height
  /// Default is 24.0
  final double? size;

  /// Optional width (overrides size if provided)
  final double? width;

  /// Optional height (overrides size if provided)
  final double? height;

  /// How to inscribe the SVG into the space allocated during layout
  final BoxFit fit;

  /// Semantic label for accessibility
  final String? semanticLabel;

  const SvgIcon({
    super.key,
    required this.assetPath,
    this.color,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width ?? size ?? 24.sp,
      height: height ?? size ?? 24.sp,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : ColorFilter.mode(Theme.of(context).brightness == Brightness.light? AppColors.gray600 : AppColors.gray400, BlendMode.srcIn),
      fit: fit,
      semanticsLabel: semanticLabel,
    );
  }
}

///Extension for common icon sizes
extension SvgIconSize on SvgIcon {
  /// Creates a small icon (16x16)
  static SvgIcon small({
    required String assetPath,
    Color? color,
    BoxFit fit = BoxFit.contain,
    String? semanticLabel,
  }) {
    return SvgIcon(
      assetPath: assetPath,
      color: color,
      size: 16.sp,
      fit: fit,
      semanticLabel: semanticLabel,
    );
  }

  /// Creates a medium icon (20x20)
  static SvgIcon medium({
    required String assetPath,
    Color? color,
    BoxFit fit = BoxFit.contain,
    String? semanticLabel,
  }) {
    return SvgIcon(
      assetPath: assetPath,
      color: color,
      size: 20.sp,
      fit: fit,
      semanticLabel: semanticLabel,
    );
  }

  /// Creates a regular icon (24x24) - default
  static SvgIcon regular({
    required String assetPath,
    Color? color,
    BoxFit fit = BoxFit.contain,
    String? semanticLabel,
  }) {
    return SvgIcon(
      assetPath: assetPath,
      color: color,
      size: 24.sp,
      fit: fit,
      semanticLabel: semanticLabel,
    );
  }
}