import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

/// Default button widget
class BaseButton extends StatefulWidget {
  const BaseButton({
    super.key,
    required this.onPressed,
    this.color,
    this.borderRadius,
    this.borderLightColor,
    this.borderDarkColor,
    this.borderWidth,
    this.elevation,
    this.padding,
    this.height,
    this.width,

    // Text attrs
    required this.text,
    this.fontSize,
    this.fontLightColor,
    this.fontDarkColor,
    this.fontStyle,
    this.fontWeight,
    this.textAlign,
  });

  // Button basic properties
  final VoidCallback onPressed;
  final Color? color;
  final double? borderRadius;
  final Color? borderLightColor;
  final Color? borderDarkColor;
  final double? borderWidth;
  final double? elevation;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  // Text style
  final String text;
  final double? fontSize;
  final Color? fontDarkColor;
  final Color? fontLightColor;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: MaterialButton(
        padding: _buttonPadding,
        elevation: widget.elevation,
        color: widget.color ?? AppColors.accent,
        onPressed: widget.onPressed,
        shape: _borderShape(isDarkMode),
        child: _buttonText,
      ),
    );
  }

  ShapeBorder _borderShape(bool isDarkMode) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppSizes.radiusLarge,
        ),
        side: BorderSide(
          color: _borderColor(isDarkMode),
          width: widget.borderWidth ?? 0,
        ),
      );

  BaseText get _buttonText => BaseText(
        text: widget.text,
        fontSize: widget.fontSize,
        fontLightColor: widget.fontLightColor,
        fontDarkColor: widget.fontDarkColor,
        fontWeight: widget.fontWeight,
        textAlign: widget.textAlign,
      );

  EdgeInsets get _buttonPadding =>
      widget.padding ??
      EdgeInsets.symmetric(
        horizontal: AppSizes.marginLarge,
        vertical: AppSizes.marginMedium,
      );

  Color _borderColor(bool isDarkMode) {
    if (isDarkMode && widget.borderDarkColor != null) {
      return widget.fontDarkColor!;
    }
    if (!isDarkMode && widget.borderLightColor != null) {
      return widget.fontLightColor!;
    }
    return AppColors.transparent;
  }
}
