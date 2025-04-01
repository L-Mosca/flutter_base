import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.lightColor,
    this.darkColor,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderLightColor,
    this.borderDarkColor,
    this.borderWidth,
    this.elevation,
  });

  final Widget child;
  final double? width;
  final double? height;
  final Color? lightColor;
  final Color? darkColor;

  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final double? borderRadius;
  final Color? borderLightColor;
  final Color? borderDarkColor;
  final double? borderWidth;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: _color(isDarkMode),
        borderRadius: _borderRadius,
        border: _border(isDarkMode),
        boxShadow: _shadow(isDarkMode),
      ),
      child: child,
    );
  }

  List<BoxShadow> _shadow(bool isDarkMode) {
    final cardElevation = elevation ?? 1;

    if (cardElevation == 0) return <BoxShadow>[];

    final shadowColor = isDarkMode
        ? AppColors.white.withValues(alpha: 0.2)
        : AppColors.black.withValues(alpha: 0.2);
    return [
      BoxShadow(
        color: shadowColor,
        blurRadius: 16.0,
        spreadRadius: (2 * cardElevation).toDouble(),
        offset: Offset(4, 4),
      ),
    ];
  }

  Color? _color(bool isDarkMode) {
    if (!isDarkMode && lightColor != null) return lightColor!;
    if (isDarkMode && darkColor != null) return darkColor!;
    return null;
  }

  BorderRadiusGeometry get _borderRadius =>
      BorderRadius.circular(borderRadius ?? AppSizes.radiusSmall);

  BoxBorder _border(bool isDarkMode) {
    Color color = AppColors.transparent;

    if (!isDarkMode && borderLightColor != null) color = borderLightColor!;
    if (isDarkMode && borderDarkColor != null) color = borderDarkColor!;

    return Border.all(
      color: color,
      width: borderWidth ?? 0.0,
    );
  }
}
