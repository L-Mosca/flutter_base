import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/summary/cart_summary_items.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/summary/cart_summary_tax.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/summary/cart_summary_total_price.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key, this.cart});

  final Cart? cart;

  @override
  Widget build(BuildContext context) {
    if (cart == null) return const SizedBox();

    return Container(
      width: double.infinity,
      decoration: _shape(context),
      margin: _margin,
      padding: const EdgeInsets.all(AppSizes.marginMedium),
      child: Column(
        children: [
          CartSummaryItems(cart: cart!),
          CartSummaryTax(cart: cart!),
          CartSummaryTotalPrice(cart: cart!),
        ],
      ),
    );
  }

  BoxDecoration _shape(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusMini),
        border: Border.all(width: 2.0, color: context.colors.productCardBorder),
      );

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginSmall,
        bottom: AppSizes.marginLarge,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      );
}
