import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductCardCategory extends StatelessWidget {
  const ProductCardCategory({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    if (category.isEmpty) return const SizedBox();

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: _padding,
        margin: _margin,
        decoration: _decoration,
        child: BaseText(
          text: category,
          fontDarkColor: AppColors.blueDark400,
          fontLightColor: AppColors.blueDark400,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.fontMini,
        ),
      ),
    );
  }

  EdgeInsets get _padding => const EdgeInsets.symmetric(
        vertical: AppSizes.marginSmall,
        horizontal: AppSizes.marginMedium,
      );

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginMedium,
        left: AppSizes.marginMedium,
      );

  BoxDecoration get _decoration => BoxDecoration(
        color: AppColors.gray100.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
      );
}
