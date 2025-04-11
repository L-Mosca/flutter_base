import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_card.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({
    super.key,
    required this.list,
    required this.onNewProductPressed,
    required this.onMinusProductPressed,
  });

  final List<Product> list;
  final void Function(Product) onNewProductPressed;
  final void Function(Product) onMinusProductPressed;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const SizedBox();

    return Container(
      margin: _margin,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CartProductCard(
            product: list[index],
            index: index,
            onNewProductPressed: onNewProductPressed,
            onMinusProductPressed: onMinusProductPressed,
          );
        },
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginLarge,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      );
}
