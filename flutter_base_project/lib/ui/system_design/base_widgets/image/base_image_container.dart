import 'package:flutter/material.dart';

enum BaseImageShape { circular, rectangle }

class BaseImageContainer extends StatelessWidget {
  const BaseImageContainer({
    super.key,
    required this.child,
    this.imageShape,
    this.customBorderRadius,
  });

  final Widget child;
  final BaseImageShape? imageShape;
  final BorderRadiusGeometry? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    if (imageShape == BaseImageShape.circular) return ClipOval(child: child);

    return ClipRRect(
      borderRadius: customBorderRadius ?? BorderRadius.zero,
      child: child,
    );
  }
}
