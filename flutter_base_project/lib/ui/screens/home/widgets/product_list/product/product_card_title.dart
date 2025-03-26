import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductCardTitle extends StatelessWidget {
  const ProductCardTitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty) return const SizedBox();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.marginMedium),
      child: BaseText(
        text: name,
        fontSize: AppSizes.fontMedium,
        fontWeight: FontWeight.w600,
        maxLines: 2,
      ),
    );
  }
}
