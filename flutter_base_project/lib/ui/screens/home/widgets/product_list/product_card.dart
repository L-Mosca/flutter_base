import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product/product_card_category.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product/product_card_image.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product/product_card_price.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product/product_card_title.dart';
import 'package:flutter_base_project/ui/screens/home/widgets/product_list/product/product_star_rating.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_card.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      lightColor: Colors.white,
      darkColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProductCardImage(product.image ?? ""),
          ProductCardTitle(name: product.title ?? ""),
          ProductCardCategory(category: product.category ?? ""),
          ProductStarRating(rate: product.rating?.rate),
          ProductCardPrice(price: product.price),
        ],
      ),
    );
  }
}
