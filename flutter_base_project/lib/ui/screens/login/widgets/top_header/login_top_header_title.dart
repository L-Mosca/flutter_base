import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class LoginTopHeaderTitle extends StatelessWidget {
  const LoginTopHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.marginLarge),
      child: BaseText(
        text: "${context.strings.welcome} ${context.strings.appName}",
        fontWeight: FontWeight.w600,
        fontSize: AppSizes.fontLarge,
      ),
    );
  }
}
