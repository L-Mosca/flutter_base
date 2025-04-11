import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';
import 'package:intl/intl.dart';

class HomeCartContainerTexts extends StatelessWidget {
  const HomeCartContainerTexts({super.key, required this.totalPrice});

  final double? totalPrice;

  @override
  Widget build(BuildContext context) {

    final formattedPrice = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
    ).format(num.parse("${totalPrice ?? 0.0}"));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: "${context.strings.totalPrice}:",
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 2.0),
        BaseText(
          text: formattedPrice,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.fontLarge,
        ),
      ],
    );
  }
}
