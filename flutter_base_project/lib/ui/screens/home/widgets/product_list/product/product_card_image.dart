import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/image/base_image_network.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductCardImage extends StatelessWidget {
  const ProductCardImage(this.imageUrl, {super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: BaseImageNetwork(
        width: 100.0,
        height: 100.0,
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  EdgeInsets get _padding => const EdgeInsets.symmetric(
        horizontal: AppSizes.marginMedium,
        vertical: AppSizes.marginMedium,
      );
}
