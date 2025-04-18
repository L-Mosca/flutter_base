import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onSettingsPressed});

  final void Function() onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.marginMini),
      child: Row(
        children: [
          const SizedBox(width: AppSizes.marginSmall),
          Expanded(
            child: BaseText(
              text: context.strings.appName,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onSettingsPressed,
            child: Container(
              padding: const EdgeInsets.all(AppSizes.marginSmall),
              child: BaseSvgIcon(
                iconPath: AppIcons.settings,
                width: 28.0,
                height: 28.0,
                iconColor: context.colors.accent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
