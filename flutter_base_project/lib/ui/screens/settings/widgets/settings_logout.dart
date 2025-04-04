import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class SettingsLogout extends StatelessWidget {
  const SettingsLogout({super.key, required this.onLogoutPressed});

  final void Function() onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.marginMedium),
      child: GestureDetector(
        onTap: onLogoutPressed,
        child: Row(
          children: [
            const SizedBox(width: AppSizes.marginMedium),
            _icon(context),
            const SizedBox(width: AppSizes.marginMedium),
            _title(context),
            const SizedBox(width: AppSizes.marginMedium),
          ],
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) => BaseSvgIcon(
        iconPath: AppIcons.logout,
        width: 28.0,
        height: 28.0,
        iconColor: context.colors.error,
      );

  Widget _title(BuildContext context) => Flexible(
        child: BaseText(
          text: context.strings.logout,
          fontSize: AppSizes.fontLarge,
          fontWeight: FontWeight.w500,
        ),
      );
}
