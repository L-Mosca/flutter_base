import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({super.key, this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    if (description == null || description?.isEmpty == true) {
      return const SizedBox();
    }

    return Container(
      margin: _margin,
      child: BaseText(
        text: description!,
        fontSize: AppSizes.fontMedium,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.symmetric(
      vertical: AppSizes.marginSmall, horizontal: AppSizes.marginMedium);
}
