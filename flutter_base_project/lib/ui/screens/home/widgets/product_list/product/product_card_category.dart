import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
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
        decoration: _decoration(context),
        child: BaseText(
          text: category,
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

  BoxDecoration _decoration(BuildContext context) {
    final color = context.isDarkMode()
        ? AppColors.blueDark700
        : AppColors.gray100.withValues(alpha: 0.4);
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
    );
  }
}
