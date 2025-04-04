import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text_field.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({
    super.key,
    required this.text,
    required this.onTextChanged,
    required this.onSubmitted,
  });

  final String text;
  final void Function(String) onTextChanged;
  final void Function(String) onSubmitted;

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: BaseTextField(
        hintText: context.strings.password,
        text: widget.text,
        onTextChanged: widget.onTextChanged,
        obscureText: obscureText,
        maxLines: 1,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.send,
        onSubmitted: widget.onSubmitted,
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon(),
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        top: AppSizes.marginSmall,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      );

  Widget get _prefixIcon => IconButton(
        onPressed: null,
        icon: SvgPicture.asset(
          AppIcons.lock,
          colorFilter: ColorFilter.mode(context.colors.accent, BlendMode.srcIn),
        ),
      );

  Widget _suffixIcon() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation.drive(Tween(begin: 0.8, end: 1.0)),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: IconButton(
        key: ValueKey<bool>(obscureText),
        iconSize: 30.0,
        onPressed: () => setState(() => obscureText = !obscureText),
        icon: BaseSvgIcon(
          width: 30.0,
          height: 30.0,
          iconPath: _eyeIcon,
          iconColor: context.colors.accent,
        ),
      ),
    );
  }

  String get _eyeIcon => obscureText ? AppIcons.eyeClose : AppIcons.eyeOpen;
}
