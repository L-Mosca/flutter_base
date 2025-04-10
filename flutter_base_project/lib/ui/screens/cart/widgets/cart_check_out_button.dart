import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_button.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartCheckOutButton extends StatelessWidget {
  const CartCheckOutButton({super.key, required this.onCheckOutPressed});

  final void Function() onCheckOutPressed;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      margin: const EdgeInsets.all(AppSizes.marginMedium),
      width: double.infinity,
      onPressed: onCheckOutPressed,
      text: context.strings.checkOut,
      fontSize: AppSizes.fontSmall,
      fontColor: context.colors.buttonFontColor,
    );
  }
}
