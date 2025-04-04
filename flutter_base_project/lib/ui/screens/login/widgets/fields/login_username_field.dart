import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text_field.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/constants/app_sizes.dart';

class LoginUsernameField extends StatelessWidget {
  const LoginUsernameField({
    super.key,
    required this.text,
    required this.onTextChanged,
  });

  final String text;
  final void Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.marginMedium),
      child: BaseTextField(
        hintText: context.strings.username,
        onTextChanged: onTextChanged,
        text: text,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        prefixIcon: _icon(context),
      ),
    );
  }

  Widget _icon(BuildContext context) => IconButton(
        onPressed: null,
        icon: SvgPicture.asset(
          AppIcons.user,
          colorFilter: ColorFilter.mode(context.colors.accent, BlendMode.srcIn),
        ),
      );
}
