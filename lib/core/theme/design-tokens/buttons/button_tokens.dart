import 'package:flutter/cupertino.dart';

import 'button_size_tokens.dart';
import 'button_state_colors.dart';

/// Button Tokens
/// Central class that combines all button design tokens
/// Use this class to access size and color tokens for buttons
class ButtonTokens {
  final BuildContext context;

  ButtonTokens._(this.context);

  // Size tokens with factory constructors
  // Usage: ButtonTokens.giant(ButtonType.text) or ButtonTokens.giant(ButtonType.icon)
  static ButtonSizeTokens giant(ButtonType type) => ButtonSizeTokens.giant(type);
  static ButtonSizeTokens large(ButtonType type) => ButtonSizeTokens.large(type);
  static ButtonSizeTokens medium(ButtonType type) => ButtonSizeTokens.medium(type);
  static ButtonSizeTokens small(ButtonType type) => ButtonSizeTokens.small(type);
  static ButtonSizeTokens tiny(ButtonType type) => ButtonSizeTokens.tiny(type);

  // Color tokens (theme-aware - uses context)
  ButtonVariantColors get filled => ButtonColorTokens(context).filled;
  ButtonVariantColors get outlined => ButtonColorTokens(context).outlined;
  ButtonVariantColors get clear => ButtonColorTokens(context).clear;

  // Additional tokens
  static double get outlinedBorderWidth => ButtonColorTokens.outlinedBorderWidth;
  static double get iconTextSpacing => ButtonColorTokens.iconTextSpacing;
}