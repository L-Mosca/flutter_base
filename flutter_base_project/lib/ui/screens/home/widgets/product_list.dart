import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.list});

  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const SizedBox();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 320.0
      ),
      itemBuilder: (context, index) => ProductCard(product: list[index]),
      itemCount: list.length,
      padding: const EdgeInsets.all(8.0),
    );
  }
}
