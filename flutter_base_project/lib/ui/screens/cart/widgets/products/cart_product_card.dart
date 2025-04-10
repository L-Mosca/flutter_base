import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_card_details.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_card_image.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_card.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      margin: const EdgeInsets.only(bottom: AppSizes.marginMedium),
      borderWidth: 2.0,
      borderColor: context.colors.productCardBorder,
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.marginMedium),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CartProductCardImage(url: product.image ?? ""),
              CartProductCardDetails(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
