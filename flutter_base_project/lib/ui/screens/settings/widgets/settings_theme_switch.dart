import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_svg_icon.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_icons.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class SettingsThemeSwitch extends StatelessWidget {
  const SettingsThemeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.marginExtraLarge),
      child: Row(
        children: [
          const SizedBox(width: AppSizes.marginMedium),
          _icon(context),
          const SizedBox(width: AppSizes.marginMedium),
          _text(context),
          _switch(context),
          const SizedBox(width: AppSizes.marginMedium),
        ],
      ),
    );
  }

  Widget _icon(BuildContext context) => BaseSvgIcon(
        iconPath: AppIcons.moon,
        width: 28.0,
        height: 28.0,
        iconColor: context.colors.accent,
      );

  Widget _text(BuildContext context) => Expanded(
        child: BaseText(
          text: context.strings.darkMode,
          fontSize: AppSizes.fontLarge,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _switch(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: context.colors.accent,
      trackColor: _trackColor(context),
      trackOutlineColor: _trackOutlineColor(context),
      trackOutlineWidth: WidgetStateProperty.all(2),
      thumbColor: _thumbColor(context),
    );
  }

  WidgetStateProperty<Color?>? _trackColor(BuildContext context) {
    return WidgetStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return context.colors.background;
        }
        return context.colors.background;
      },
    );
  }

  WidgetStateProperty<Color?>? _trackOutlineColor(BuildContext context) {
    return WidgetStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(WidgetState.selected)) return context.colors.accent;
        return context.colors.accent;
      },
    );
  }

  WidgetStateProperty<Color?>? _thumbColor(BuildContext context) {
    return WidgetStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(WidgetState.selected)) return context.colors.accent;
        return context.colors.accent;
      },
    );
  }
}
