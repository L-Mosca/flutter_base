import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_button.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailError extends StatelessWidget {
  const ProductDetailError({super.key, required this.onReloadPressed});

  final void Function() onReloadPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.marginExtraLarge),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(context),
          _title(context),
          _message(context),
          _retryButton(context),
        ],
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.error,
      width: 80.0,
      height: 80.0,
      fit: BoxFit.fill,
      iconColor: context.colors.error,
    );
  }

  Widget _title(BuildContext context) {
    return BaseText(
      text: context.strings.somethingWrong,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
    );
  }

  Widget _message(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.marginExtraLarge,
        vertical: AppSizes.marginMedium,
      ),
      child: BaseText(
        text: context.strings.productDetailError,
        fontSize: AppSizes.fontMedium,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _retryButton(BuildContext context) {
    return BaseButton(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      width: double.infinity,
      onPressed: onReloadPressed,
      text: context.strings.tryAgain,
    );
  }
}
