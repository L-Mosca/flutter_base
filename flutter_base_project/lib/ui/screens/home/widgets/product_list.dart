import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.list,
    required this.onProductPressed,
  });

  final List<Product> list;
  final void Function(int) onProductPressed;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const SizedBox();

    return GridView.builder(
      gridDelegate: _gridDelegate,
      itemCount: list.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) => ProductCard(
        product: list[index],
        onProductPressed: onProductPressed,
      ),
    );
  }

  SliverGridDelegate get _gridDelegate =>
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 330.0,
      );
}
