import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class LoginTopHeaderIcon extends StatelessWidget {
  const LoginTopHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: context.colors.accent,
        borderRadius: BorderRadius.circular(AppSizes.radiusMini),
      ),
      child: Center(
        child: BaseSvgIcon(
          width: 46.0,
          height: 46.0,
          iconPath: AppIcons.cart,
        ),
      ),
    );
  }
}
