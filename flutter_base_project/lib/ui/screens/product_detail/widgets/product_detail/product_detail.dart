import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_description.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_image.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_price.dart';
import 'package:flutter_base_project/ui/screens/product_detail/widgets/product_detail/product_detail_title.dart';

import '../../../home/widgets/product_list/product/product_star_rating.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailImage(imageUrl: product?.image),
            ProductDetailTitle(title: product?.title),
            ProductDetailDescription(description: product?.description),
            ProductStarRating(rate: product?.rating?.rate),
            ProductDetailPrice(price: product?.price),
          ],
        ),
      ),
    );
  }
}
