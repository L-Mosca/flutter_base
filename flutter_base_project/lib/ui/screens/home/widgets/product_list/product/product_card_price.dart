import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';
import 'package:flutter_base_project/utils/extensions/product_extensions.dart';

class ProductCardPrice extends StatelessWidget {
  const ProductCardPrice({super.key, this.price});

  final double? price;

  @override
  Widget build(BuildContext context) {
    if (price == null) return const SizedBox();

    return Container(
      width: double.infinity,
      margin: _margin,
      child: BaseText(
        text: "R\$ $price",
        fontWeight: FontWeight.w600,
        fontLightColor: AppColors.accent,
        fontDarkColor: AppColors.accent,
        fontSize: AppSizes.fontLarge,
      ),
    );

    /*return FutureBuilder<String>(
      future: price!.formatCurrency(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        return Container(
          width: double.infinity,
          margin: _margin,
          child: BaseText(
            text: snapshot.data!,
            fontWeight: FontWeight.w600,
            fontLightColor: AppColors.accent,
            fontDarkColor: AppColors.accent,
            fontSize: AppSizes.fontLarge,
          ),
        );
      },
    );*/
  }

  EdgeInsets get _margin => const EdgeInsets.all(AppSizes.marginMedium);
}
