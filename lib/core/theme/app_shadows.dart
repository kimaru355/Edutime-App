import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App Shadows
/// Contains all shadow/elevation definitions for the application
class AppShadows {
  AppShadows._();

  // Base shadow color
  static final Color _shadowColor = AppColors.gray400;

  /// Small shadow
  /// Single shadow: offset(0, 1), blur: 2, spread: 0, opacity: 0.05
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: _shadowColor.withAlpha(13),
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  /// Default shadow
  /// Two shadows combined for depth
  /// 1. offset(0, 1), blur: 3, spread: 0, opacity: 0.10
  /// 2. offset(0, 1), blur: 2, spread: -1, opacity: 0.10
  static List<BoxShadow> get defaultShadow => [
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: -1,
    ),
  ];

  /// Medium shadow
  /// Two shadows combined for medium elevation
  /// 1. offset(0, 4), blur: 6, spread: -1, opacity: 0.10
  /// 2. offset(0, 2), blur: 4, spread: -2, opacity: 0.10
  static List<BoxShadow> get md => [
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
    ),
  ];

  /// Large shadow
  /// Two shadows combined for high elevation
  /// 1. offset(0, 10), blur: 15, spread: -3, opacity: 0.10
  /// 2. offset(0, 4), blur: 6, spread: -4, opacity: 0.10
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -4,
    ),
  ];

  /// Extra large shadow
  /// Two shadows combined for very high elevation
  /// 1. offset(0, 20), blur: 25, spread: -5, opacity: 0.10
  /// 2. offset(0, 8), blur: 10, spread: -6, opacity: 0.10
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
    ),
    BoxShadow(
      color: _shadowColor.withAlpha(26),
      offset: const Offset(0, 8),
      blurRadius: 10,
      spreadRadius: -6,
    ),
  ];

  /// 2X Extra large shadow
  /// Single very prominent shadow for maximum elevation
  /// offset(0, 25), blur: 50, spread: -12, opacity: 0.25
  static List<BoxShadow> get xxl => [
    BoxShadow(
      color: _shadowColor.withAlpha(64),
      offset: const Offset(0, 25),
      blurRadius: 50,
      spreadRadius: -12,
    ),
  ];
}