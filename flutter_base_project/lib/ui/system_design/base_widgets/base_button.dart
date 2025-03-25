import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_constants.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

/// Default button widget
class BaseButton extends StatelessWidget {
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
    this.showLoading,

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
  final bool? showLoading;

  // Text style
  final String text;
  final double? fontSize;
  final Color? fontDarkColor;
  final Color? fontLightColor;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();
    return AnimatedSwitcher(
      duration: AppConstants.defaultAnimationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: showLoading == true ? _loading(isDarkMode) : _button(isDarkMode),
    );
  }

  Widget _button(bool isDarkMode) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        padding: _buttonPadding,
        elevation: elevation,
        color: color ?? AppColors.accent,
        onPressed: onPressed,
        shape: _borderShape(isDarkMode),
        child: _buttonText(isDarkMode),
      ),
    );
  }

  ShapeBorder _borderShape(bool isDarkMode) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.radiusMini,
        ),
        side: BorderSide(
          color: _borderColor(isDarkMode),
          width: borderWidth ?? 0,
        ),
      );

  BaseText _buttonText(bool isDarkMode) {
    return BaseText(
      text: text,
      fontSize: fontSize ?? AppSizes.fontMedium,
      fontLightColor: _fontLightColor(isDarkMode),
      fontDarkColor: _fontDarkColor(isDarkMode),
      fontWeight: fontWeight ?? FontWeight.w600,
      textAlign: textAlign,
    );
  }

  Widget _loading(bool isDarkMode) {
    return Container(
      width: width,
      height: height,
      padding: _buttonPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.radiusMini,
        ),
        border: Border.all(
          color: _borderColor(isDarkMode),
          width: borderWidth ?? 1.0,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 22.0,
          width: 22.0,
          child: CircularProgressIndicator(
            color: AppColors.accent,
            strokeWidth: 3.0,
          ),
        ),
      ),
    );
  }

  Color _fontLightColor(bool isDarkMode) {
    if (!isDarkMode && fontLightColor != null) return fontLightColor!;

    return AppColors.white;
  }

  Color _fontDarkColor(bool isDarkMode) {
    if (isDarkMode && fontDarkColor != null) return fontDarkColor!;

    return AppColors.white;
  }

  EdgeInsets get _buttonPadding =>
      padding ??
      EdgeInsets.symmetric(
        horizontal: AppSizes.marginLarge,
        vertical: 14.0,
      );

  Color _borderColor(bool isDarkMode) {
    if (isDarkMode && borderDarkColor != null) {
      return borderDarkColor!;
    }
    if (!isDarkMode && borderLightColor != null) {
      return borderLightColor!;
    }
    return AppColors.transparent;
  }
}
