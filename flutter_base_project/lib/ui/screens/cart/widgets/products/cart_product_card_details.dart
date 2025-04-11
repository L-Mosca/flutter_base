import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/products/cart_product_card_quantity.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';
import 'package:intl/intl.dart';

class CartProductCardDetails extends StatelessWidget {
  const CartProductCardDetails({
    super.key,
    required this.product,
    required this.onNewProductPressed,
    required this.onMinusProductPressed,
  });

  final Product product;
  final void Function(Product) onNewProductPressed;
  final void Function(Product) onMinusProductPressed;

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
              quantity: product.quantity,
              onPlusPressed: () => onNewProductPressed(product),
              onMinusPressed: () => onMinusProductPressed(product),
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
    final price = product.price ?? 0.0;
    final formattedPrice = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
    ).format(num.parse("$price"));

    return Align(
      alignment: Alignment.bottomLeft,
      child: BaseText(
        text: formattedPrice,
        fontWeight: FontWeight.w700,
        fontColor: context.colors.accent,
      ),
    );
  }
}
