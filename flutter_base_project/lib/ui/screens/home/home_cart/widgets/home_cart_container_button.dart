import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_button.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class HomeCartContainerButton extends StatelessWidget {
  const HomeCartContainerButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      text: context.strings.seeCart,
      fontColor: context.colors.buttonFontColor,
      fontSize: AppSizes.fontSmall,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.marginExtraLarge,
        vertical: 12.0,
      ),
    );
  }
}
