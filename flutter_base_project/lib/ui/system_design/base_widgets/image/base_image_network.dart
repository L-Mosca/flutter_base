import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/image/base_image_container.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class BaseImageNetwork extends StatelessWidget {
  const BaseImageNetwork({
    super.key,
    required this.imageUrl,
    this.errorPlaceHolder,
    this.customLoading,
    this.borderRadius,
    this.height,
    this.width,
    this.imageShape,
    this.fit,
    this.filterQuality,
  });

  final String? imageUrl;
  final String? errorPlaceHolder;
  final Widget? customLoading;
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
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      imageUrl ?? "",
      fit: fit ?? BoxFit.cover,
      filterQuality: filterQuality ?? FilterQuality.high,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return customLoading ?? _showDefaultLoading();
      },
      errorBuilder: (context, error, stackTrace) {
        if (errorPlaceHolder != null) {
          return Image.asset(errorPlaceHolder!, fit: BoxFit.cover);
        }

        return const SizedBox();
      },
    );
  }

  Widget _showDefaultLoading() => Container(
        padding: const EdgeInsets.all(AppSizes.marginMedium),
        child: CircularProgressIndicator(
          color: AppColors.white,
          strokeWidth: 4.0,
        ),
      );
}
