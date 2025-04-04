import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class LoginTopHeaderMessage extends StatelessWidget {
  const LoginTopHeaderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.marginSmall,
        bottom: AppSizes.marginLarge,
      ),
      child: BaseText(
        text: context.strings.signInToContinue,
        fontWeight: FontWeight.w500,
        fontSize: AppSizes.fontSmall,
      ),
    );
  }
}
