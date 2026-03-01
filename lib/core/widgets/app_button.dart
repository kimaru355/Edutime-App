import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edutime/core/theme/app_text_styles.dart';
import 'package:edutime/core/widgets/svg_icon.dart';

import '../theme/design-tokens/buttons/button_size_tokens.dart';
import '../theme/design-tokens/buttons/button_state_colors.dart';
import '../theme/design-tokens/buttons/button_tokens.dart';

/// Button Size Enum
enum AppButtonSize { giant, large, medium, small, tiny }

/// Button Variant Enum
enum AppButtonVariant { filled, outlined, clear }

/// App Button Widget
/// A unified button component that handles both text and icon-only buttons
///
/// Supports:
/// - 5 sizes: giant, large, medium, small, tiny
/// - 3 variants: filled, outlined, clear
/// - 3 states: default, pressed, disabled
/// - Text buttons with optional leading/trailing icons
/// - Icon-only buttons (when label is null and icon is provided)
/// - Full width option for text buttons
/// - Theme-aware colors (light/dark mode)
class AppButton extends StatefulWidget {
  /// Button label text (optional for icon-only buttons)
  final String? label;

  /// Icon for icon-only button or leading icon for text button
  final SvgIcon? icon;

  /// Trailing icon (only for text buttons)
  final SvgIcon? trailingIcon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button size (default: medium)
  final AppButtonSize size;

  /// Button variant (default: filled)
  final AppButtonVariant variant;

  /// Text style for the button label (only applies to text buttons)
  /// If not provided, uses default text style based on size
  final TextStyle? textStyle;

  /// Full width button (only applies to text buttons)
  final bool isFullWidth;

  /// Semantic label for accessibility (especially important for icon-only buttons)
  final String? semanticLabel;

  const AppButton({
    super.key,
    this.label,
    this.icon,
    this.trailingIcon,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.variant = AppButtonVariant.filled,
    this.textStyle,
    this.isFullWidth = false,
    this.semanticLabel,
  }) : assert(
  label != null || icon != null,
  'Either label or icon must be provided',
  );

  /// Factory constructor for text button with optional icons
  factory AppButton.text({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    AppButtonVariant variant = AppButtonVariant.filled,
    SvgIcon? leadingIcon,
    SvgIcon? trailingIcon,
    TextStyle? textStyle,
    bool isFullWidth = false,
    String? semanticLabel,
  }) {
    return AppButton(
      label: label,
      icon: leadingIcon,
      trailingIcon: trailingIcon,
      onPressed: onPressed,
      size: size,
      variant: variant,
      textStyle: textStyle,
      isFullWidth: isFullWidth,
      semanticLabel: semanticLabel,
    );
  }

  /// Factory constructor for icon-only button
  factory AppButton.icon({
    required SvgIcon icon,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    AppButtonVariant variant = AppButtonVariant.filled,
    String? semanticLabel,
  }) {
    return AppButton(
      icon: icon,
      onPressed: onPressed,
      size: size,
      variant: variant,
      semanticLabel: semanticLabel,
    );
  }

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  /// Check if this is an icon-only button
  bool get _isIconOnly => widget.label == null && widget.icon != null;

  /// Get appropriate button type based on whether it's icon-only or text
  ButtonType get _buttonType => _isIconOnly ? ButtonType.icon : ButtonType.text;

  /// Get size tokens based on button size and type
  ButtonSizeTokens _getSizeTokens() {
    switch (widget.size) {
      case AppButtonSize.giant:
        return ButtonTokens.giant(_buttonType);
      case AppButtonSize.large:
        return ButtonTokens.large(_buttonType);
      case AppButtonSize.medium:
        return ButtonTokens.medium(_buttonType);
      case AppButtonSize.small:
        return ButtonTokens.small(_buttonType);
      case AppButtonSize.tiny:
        return ButtonTokens.tiny(_buttonType);
    }
  }

  /// Get default text style based on button size (only for text buttons)
  TextStyle _getDefaultTextStyle() {
    switch (widget.size) {
      case AppButtonSize.giant:
        return AppTextStyles.body1SemiBold; // 17px, weight 600
      case AppButtonSize.large:
        return AppTextStyles.ctaButtonSemiBold; // 16px, weight 600
      case AppButtonSize.medium:
        return AppTextStyles.body2SemiBold; // 15px, weight 600
      case AppButtonSize.small:
        return AppTextStyles.ctaLinkSemiBold; // 14px, weight 600
      case AppButtonSize.tiny:
        return AppTextStyles.body3SemiBold; // 13px, weight 600
    }
  }

  /// Get color tokens based on button variant
  ButtonVariantColors _getColorTokens() {
    final colorTokens = ButtonColorTokens(context);
    switch (widget.variant) {
      case AppButtonVariant.filled:
        return colorTokens.filled;
      case AppButtonVariant.outlined:
        return colorTokens.outlined;
      case AppButtonVariant.clear:
        return colorTokens.clear;
    }
  }

  /// Get current state colors based on enabled/disabled and pressed state
  ButtonStateColors _getCurrentStateColors() {
    final colorTokens = _getColorTokens();
    final isDisabled = widget.onPressed == null;

    if (isDisabled) {
      return colorTokens.disabledColors;
    } else if (_isPressed) {
      return colorTokens.pressedColors;
    } else {
      return colorTokens.defaultColors;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeTokens = _getSizeTokens();
    final stateColors = _getCurrentStateColors();
    final isDisabled = widget.onPressed == null;

    return Semantics(
      button: true,
      enabled: !isDisabled,
      label: widget.semanticLabel ?? widget.label,
      child: GestureDetector(
        onTapDown: isDisabled ? null : (_) => setState(() => _isPressed = true),
        onTapUp: isDisabled ? null : (_) => setState(() => _isPressed = false),
        onTapCancel: isDisabled ? null : () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: !_isIconOnly && widget.isFullWidth ? double.infinity : null,
          padding: sizeTokens.padding,
          decoration: BoxDecoration(
            color: stateColors.backgroundColor,
            borderRadius: BorderRadius.circular(sizeTokens.borderRadius),
            border: widget.variant == AppButtonVariant.outlined
                ? Border.all(
              color: stateColors.borderColor!,
              width: ButtonTokens.outlinedBorderWidth,
            )
                : null,
          ),
          child: _isIconOnly ? _buildIconOnly(stateColors) : _buildTextButton(stateColors),
        ),
      ),
    );
  }

  /// Build icon-only button content
  Widget _buildIconOnly(ButtonStateColors stateColors) {
    return _buildIcon(widget.icon!, stateColors.foregroundColor);
  }

  /// Build text button content (with optional icons)
  Widget _buildTextButton(ButtonStateColors stateColors) {
    return Row(
      mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          _buildIcon(widget.icon!, stateColors.foregroundColor),
          SizedBox(width: ButtonTokens.iconTextSpacing.w),
        ],
        Text(
          widget.label!,
          style: widget.textStyle?.copyWith(color: stateColors.foregroundColor,) ??
              _getDefaultTextStyle().copyWith(color: stateColors.foregroundColor,),
        ),
        if (widget.trailingIcon != null) ...[
          SizedBox(width: ButtonTokens.iconTextSpacing.w),
          _buildIcon(widget.trailingIcon!, stateColors.foregroundColor),
        ],
      ],
    );
  }

  /// Build icon with proper color
  Widget _buildIcon(SvgIcon icon, Color color) {
    return SvgIcon(
      assetPath: icon.assetPath,
      color: color,
      size: icon.size,
      width: icon.width,
      height: icon.height,
      fit: icon.fit,
      semanticLabel: icon.semanticLabel,
    );
  }
}