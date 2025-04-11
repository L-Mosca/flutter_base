import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class CartProductCardQuantity extends StatelessWidget {
  const CartProductCardQuantity({
    super.key,
    required this.quantity,
    required this.onPlusPressed,
    required this.onMinusPressed,
  });

  final int quantity;
  final void Function() onPlusPressed;
  final void Function() onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMini),
            color: context.colors.hover,
          ),
          child: Row(
            children: [
              _minus(context),
              _quantity(),
              _plus(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _minus(BuildContext context) {
    return GestureDetector(
      onTap: onMinusPressed,
      child: Container(
        height: 30.0,
        width: 30.0,
        padding: EdgeInsets.all(2.0),
        decoration: _minusShape(context),
        child: Center(
          child: BaseSvgIcon(
            iconPath: AppIcons.minus,
            width: 30.0,
            height: 30.0,
            iconColor: AppColors.gray300,
          ),
        ),
      ),
    );
  }

  Widget _quantity() {
    return SizedBox(
      width: 40.0,
      child: BaseText(
        textAlign: TextAlign.center,
        text: quantity.toString(),
        fontWeight: FontWeight.w800,
        fontSize: AppSizes.fontMedium,
      ),
    );
  }

  Widget _plus(BuildContext context) {
    return GestureDetector(
      onTap: onPlusPressed,
      child: Container(
        height: 30.0,
        width: 30.0,
        padding: EdgeInsets.all(2.0),
        decoration: _plusShape(context),
        child: Center(
          child: BaseSvgIcon(
            iconPath: AppIcons.plus,
            width: 30.0,
            height: 30.0,
            iconColor: AppColors.gray300,
          ),
        ),
      ),
    );
  }

  BoxDecoration _minusShape(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radiusMini),
          bottomLeft: Radius.circular(AppSizes.radiusMini),
        ),
        color: context.colors.cardColor,
      );

  BoxDecoration _plusShape(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSizes.radiusMini),
          bottomRight: Radius.circular(AppSizes.radiusMini),
        ),
        color: context.colors.cardColor,
      );
}
