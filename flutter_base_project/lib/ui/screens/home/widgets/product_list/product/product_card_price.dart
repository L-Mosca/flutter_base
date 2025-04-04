import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';
import 'package:intl/intl.dart';

class ProductCardPrice extends StatelessWidget {
  const ProductCardPrice({super.key, this.price});

  final double? price;

  @override
  Widget build(BuildContext context) {
    if (price == null) return const SizedBox();

    final formattedPrice = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
    ).format(num.parse("$price"));

    return Container(
      width: double.infinity,
      margin: _margin,
      child: BaseText(
        text: " $formattedPrice",
        fontWeight: FontWeight.w600,
        fontSize: AppSizes.fontLarge,
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
        top: AppSizes.marginSmall,
      );
}
