import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/loading/base_shimmer_effect.dart';

class BaseShimmer extends StatelessWidget {
  const BaseShimmer({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.borderRadius,
  });

  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return BaseShimmerEffect(
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.colors.shimmerPrimaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        ),
      ),
    );
  }
}
