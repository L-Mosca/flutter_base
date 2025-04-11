import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_button.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_card.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailAddCartButton extends StatelessWidget {
  const ProductDetailAddCartButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      customBorder: _border,
      child: Container(
        margin: _margin,
        child: BaseButton(
          width: double.infinity,
          onPressed: onPressed,
          text: context.strings.addToCart,
        ),
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: AppSizes.marginMedium,
      );

  BorderRadiusGeometry get _border => BorderRadius.only(
        topLeft: Radius.circular(AppSizes.radiusSmall),
        topRight: Radius.circular(AppSizes.radiusSmall),
      );
}
