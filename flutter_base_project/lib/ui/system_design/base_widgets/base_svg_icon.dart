import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseSvgIcon extends StatelessWidget {
  const BaseSvgIcon({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.iconColor,
    this.fit,
  });

  final String iconPath;
  final double? width;
  final double? height;
  final Color? iconColor;
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
    if (iconColor != null) return ColorFilter.mode(iconColor!, BlendMode.srcIn);
    return null;
  }
}
