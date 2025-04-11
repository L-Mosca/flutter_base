import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartSummaryTax extends StatelessWidget {
  const CartSummaryTax({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.marginSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(context),
          _data(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return BaseText(
      text: context.strings.tax,
      fontWeight: FontWeight.w400,
      fontColor: context.colors.cartSummaryText,
    );
  }

  Widget _data(BuildContext context) {
    return BaseText(
      text: "-",
      fontWeight: FontWeight.w600,
      fontColor: context.colors.cartSummaryText,
    );
  }
}
