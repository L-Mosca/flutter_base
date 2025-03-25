import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseSvgIcon extends StatelessWidget {
  const BaseSvgIcon({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.iconLightColor,
    this.iconDarkColor,
    this.fit,
  });

  final String iconPath;
  final double? width;
  final double? height;
  final Color? iconLightColor;
  final Color? iconDarkColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: width,
      height: height,
      colorFilter: _iconColor(context),
      fit: fit ?? BoxFit.fill,
    );
  }

  ColorFilter? _iconColor(BuildContext context) {
    if (iconLightColor == null && iconDarkColor == null) return null;
    final isDark = context.isDarkMode();

    if (!isDark && iconLightColor != null) {
      return ColorFilter.mode(iconLightColor!, BlendMode.srcIn);
    }
    if (isDark && iconDarkColor != null) {
      return ColorFilter.mode(iconDarkColor!, BlendMode.srcIn);
    }

    return null;
  }
}
