import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:intl/intl.dart';

class CartSummaryItems extends StatelessWidget {
  const CartSummaryItems({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title(context),
        _data(context),
      ],
    );
  }

  Widget _title(BuildContext context) {
    return BaseText(
      text: "${context.strings.items} (${cart.products.length})",
      fontWeight: FontWeight.w400,
      fontColor: context.colors.cartSummaryText,
    );
  }

  Widget _data(BuildContext context) {
    final price = cart.payment.totalValue;
    final formattedPrice = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
    ).format(num.parse("$price"));

    return BaseText(
      text: formattedPrice,
      fontWeight: FontWeight.w600,
      fontColor: context.colors.cartSummaryText,
    );
  }
}
