import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_state.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_list.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/summary/cart_summary.dart';

class CartContent extends StatelessWidget {
  const CartContent({
    super.key,
    required this.state,
    required this.onNewProductPressed,
    required this.onMinusProductPressed,
  });

  final CartState state;
  final void Function(Product) onNewProductPressed;
  final void Function(Product) onMinusProductPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CartProductList(
              list: state.cart?.products ?? [],
              onNewProductPressed: onNewProductPressed,
              onMinusProductPressed: onMinusProductPressed,
            ),
            CartSummary(cart: state.cart),
          ],
        ),
      ),
    );
  }
}
