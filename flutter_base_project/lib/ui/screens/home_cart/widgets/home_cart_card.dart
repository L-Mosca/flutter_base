import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/screens/home_cart/bloc/home_cart_state.dart';
import 'package:flutter_base_project/ui/screens/home_cart/widgets/home_cart_container_button.dart';
import 'package:flutter_base_project/ui/screens/home_cart/widgets/home_cart_container_texts.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_card.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class HomeCartCard extends StatelessWidget {
  const HomeCartCard({
    super.key,
    required this.state,
    required this.onSeeCartPressed,
  });

  final HomeCartState state;
  final void Function() onSeeCartPressed;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      width: double.infinity,
      padding: _padding,
      customBorder: _borderRadius,
      color: context.colors.cartContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeCartContainerTexts(totalPrice: state.cart?.payment.totalValue),
          HomeCartContainerButton(onPressed: onSeeCartPressed),
        ],
      ),
    );
  }

  EdgeInsets get _padding => const EdgeInsets.symmetric(
        horizontal: AppSizes.marginLarge,
        vertical: AppSizes.marginMedium,
      );

  BorderRadiusGeometry get _borderRadius => BorderRadius.only(
        topLeft: Radius.circular(AppSizes.radiusSmall),
        topRight: Radius.circular(AppSizes.radiusSmall),
      );
}
