import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class LoginGenerateUserDivider extends StatelessWidget {
  const LoginGenerateUserDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: Row(
        children: [
          _line(EdgeInsets.only(right: AppSizes.marginMedium), context),
          _text(context),
          _line(EdgeInsets.only(left: AppSizes.marginMedium), context),
        ],
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginLarge,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      );

  Widget _text(BuildContext context) {
    return BaseText(
      text: context.strings.or.toUpperCase(),
      fontWeight: FontWeight.w600,
      fontSize: AppSizes.fontLarge,
    );
  }

  Widget _line(EdgeInsets margin, BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        height: 2.0,
        color: _lineColor(context),
      ),
    );
  }

  Color _lineColor(BuildContext context) {
    final isDark = context.isDarkMode();
    if (isDark) return AppColors.blueDark600;
    return AppColors.gray100;
  }
}
