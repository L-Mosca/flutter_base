import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_state.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_list.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/summary/cart_summary.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key, required this.state});

  final CartState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CartProductList(list: state.cart?.products ?? []),
            CartSummary(cart: state.cart),
          ],
        ),
      ),
    );
  }
}
