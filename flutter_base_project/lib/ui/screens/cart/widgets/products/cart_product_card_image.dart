import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/image/base_image_network.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartProductCardImage extends StatelessWidget {
  const CartProductCardImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 80.0,
      padding: const EdgeInsets.all(AppSizes.marginMedium),
      decoration: BoxDecoration(
        color: context.colors.imageBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
      ),
      child: Center(
        child: BaseImageNetwork(imageUrl: url),
      ),
    );
  }
}
