import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/image/base_image_network.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class ProductDetailImage extends StatelessWidget {
  const ProductDetailImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      child: Center(
        child: SizedBox(
          height: 200.0,
          child: BaseImageNetwork(
            imageUrl: imageUrl,
            height: 200.0,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
