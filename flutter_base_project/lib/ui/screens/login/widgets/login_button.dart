import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_button.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.showLoading,
  });

  final void Function() onPressed;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: BaseButton(
        width: double.infinity,
        onPressed: onPressed,
        text: context.strings.login,
        showLoading: showLoading,
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginMedium,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      );
}
