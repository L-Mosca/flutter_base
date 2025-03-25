import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class LoginGenerateUser extends StatelessWidget {
  const LoginGenerateUser({super.key, required this.onGenerateUserPressed});

  final void Function() onGenerateUserPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.marginLarge,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseText(
            text: context.strings.dontHaveAccount,
            fontLightColor: AppColors.gray500,
            fontDarkColor: AppColors.gray100,
          ),
          const SizedBox(width: 2.0),
          GestureDetector(
            onTap: onGenerateUserPressed,
            child: BaseText(
              text: context.strings.clickHere,
              decoration: TextDecoration.underline,
              fontLightColor: AppColors.blue400,
              fontDarkColor: AppColors.blue200,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
