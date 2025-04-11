import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
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
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.showLoading,

    // Text attrs
    required this.text,
    this.fontSize,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
    this.textAlign,
  });

  // Button basic properties
  final VoidCallback onPressed;
  final Color? color;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final bool? showLoading;

  // Text style
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppConstants.defaultAnimationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: showLoading == true ? _loading(context) : _button(context),
    );
  }

  Widget _button(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: MaterialButton(
        padding: _buttonPadding,
        elevation: elevation,
        color: color ?? context.colors.accent,
        onPressed: onPressed,
        shape: _borderShape(),
        child: _buttonText(context),
      ),
    );
  }

  ShapeBorder _borderShape() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.radiusMini,
        ),
        side: BorderSide(
          color: _borderColor(),
          width: borderWidth ?? 0,
        ),
      );

  BaseText _buttonText(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: fontSize ?? AppSizes.fontMedium,
      fontWeight: fontWeight ?? FontWeight.w600,
      textAlign: textAlign,
      fontColor: fontColor ?? context.colors.text,
    );
  }

  Widget _loading(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: _buttonPadding,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor(), width: borderWidth ?? 1.0),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.radiusMini,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 22.0,
          width: 22.0,
          child: CircularProgressIndicator(
            color: context.colors.accent,
            strokeWidth: 3.0,
          ),
        ),
      ),
    );
  }

  EdgeInsets get _buttonPadding =>
      padding ??
      EdgeInsets.symmetric(
        horizontal: AppSizes.marginLarge,
        vertical: 14.0,
      );

  Color _borderColor() {
    if (borderColor != null) return borderColor!;
    return AppColors.transparent;
  }
}
