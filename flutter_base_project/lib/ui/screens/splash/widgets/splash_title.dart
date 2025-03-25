import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: context.strings.appName,
      fontDarkColor: AppColors.white,
      fontLightColor: AppColors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w600,
    );
  }
}
