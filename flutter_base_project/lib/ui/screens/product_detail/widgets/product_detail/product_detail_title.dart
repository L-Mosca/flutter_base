import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailTitle extends StatelessWidget {
  const ProductDetailTitle({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    if (title == null || title?.isEmpty == true) return const SizedBox();

    return Container(
      margin: _margin,
      width: double.infinity,
      child: BaseText(
        text: title!,
        fontWeight: FontWeight.w700,
        fontSize: 20.0,
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginMini,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      );
}
