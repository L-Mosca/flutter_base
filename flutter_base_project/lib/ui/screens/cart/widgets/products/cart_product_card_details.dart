import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_card_quantity.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartProductCardDetails extends StatelessWidget {
  const CartProductCardDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: AppSizes.marginMedium),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                _price(context),
              ],
            ),
            CartProductCardQuantity(
              quantity: 1,
              onPlusPressed: () {},
              onMinusPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return BaseText(
      text: "Nike Air Zoom Pegasus 36 Miami",
      fontWeight: FontWeight.w800,
    );
  }

  Widget _price(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: BaseText(
        text: "RS299,43",
        fontWeight: FontWeight.w700,
        fontColor: context.colors.accent,
      ),
    );
  }
}
