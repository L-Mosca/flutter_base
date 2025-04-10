import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';

class BaseLine extends StatelessWidget {
  const BaseLine({
    super.key,
    this.width,
    this.height,
    this.color,
    this.enableShadows = true,
    this.margin,
    this.padding,
  });

  final double? width;
  final double? height;
  final Color? color;
  final bool enableShadows;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 2.0,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? context.colors.line.withValues(alpha: 0.2),
        boxShadow: _shadow(context),
      ),
    );
  }

  List<BoxShadow> _shadow(BuildContext context) {
    if (!enableShadows) return <BoxShadow>[];

    return [
      BoxShadow(
        color: context.colors.shadow,
        blurRadius: 8.0,
        spreadRadius: 2.0,
        offset: Offset(4, 4),
      ),
    ];
  }
}
