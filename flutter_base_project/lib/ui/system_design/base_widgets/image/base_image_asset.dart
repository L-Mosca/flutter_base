import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/image/base_image_container.dart';

class BaseImageAsset extends StatelessWidget {
  const BaseImageAsset({
    super.key,
    required this.imagePath,
    this.borderRadius,
    this.height,
    this.width,
    this.imageShape,
    this.fit,
    this.filterQuality,
  });

  final String imagePath;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final BaseImageShape? imageShape;
  final BoxFit? fit;
  final FilterQuality? filterQuality;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: BaseImageContainer(
        customBorderRadius: borderRadius,
        imageShape: imageShape,
        child: Image.asset(
          imagePath,
          fit: fit ?? BoxFit.cover,
          filterQuality: filterQuality ?? FilterQuality.high,
        ),
      ),
    );
  }
}
