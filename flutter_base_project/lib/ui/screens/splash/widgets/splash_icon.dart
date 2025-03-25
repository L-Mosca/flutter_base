import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';

class SplashIcon extends StatelessWidget {
  const SplashIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.cart,
      width: 120.0,
      height: 120.0,
    );
  }
}
