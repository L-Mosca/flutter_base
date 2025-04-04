import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_button.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailAddCartButton extends StatelessWidget {
  const ProductDetailAddCartButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: BaseButton(
        width: double.infinity,
        onPressed: onPressed,
        text: context.strings.addToCart,
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: AppSizes.marginMedium,
      );
}
