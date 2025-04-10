import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartSummaryTotalPrice extends StatelessWidget {
  const CartSummaryTotalPrice({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.marginMedium),
      child: Column(
        children: [
          Container(height: 1.0, color: context.colors.productCardBorder),
          const SizedBox(height: AppSizes.marginMedium),
          _content(context),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
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
      text: context.strings.totalPrice,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _data(BuildContext context) {
    return BaseText(
      text: "RS598.86",
      fontWeight: FontWeight.w700,
      fontColor: context.colors.accent,
    );
  }
}
