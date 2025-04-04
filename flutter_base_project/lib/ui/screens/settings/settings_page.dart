import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_bloc.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_event.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_state.dart';
import 'package:flutter_base_project/ui/screens/settings/widgets/settings_app_bar.dart';
import 'package:flutter_base_project/ui/screens/settings/widgets/settings_logout.dart';
import 'package:flutter_base_project/ui/screens/settings/widgets/settings_theme_switch.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<SettingsBloc, SettingsEvent, SettingsState>(
      listener: _onChange,
      builder: _pageContent,
    );
  }

  void _onChange(BuildContext context, SettingsState state) {
    _changeTheme(context, state);
    _logoutSuccess(context, state);
  }

  Widget _pageContent(BuildContext context, SettingsState state) {
    return SafeArea(
      child: Scaffold(
        appBar: SettingsAppBar(onBackPressed: () => Navigator.pop(context)),
        body: Column(
          children: [
            SettingsThemeSwitch(
              value: state.isDarkMode,
              onChanged: (value) => _onSwitchChanged(context, value),
            ),
            SettingsLogout(onLogoutPressed: () => _onLogoutPressed(context)),
          ],
        ),
      ),
    );
  }

  void _onSwitchChanged(BuildContext context, bool newValue) {
    context.read<SettingsBloc>().add(
          SettingsChangeThemeEvent(isDarkMode: newValue),
        );
  }

  void _onLogoutPressed(BuildContext context) {
    context.read<SettingsBloc>().add(SettingsLogoutEvent());
  }

  void _changeTheme(BuildContext context, SettingsState state) {
    if (state.listener == SettingsListener.changeTheme) {
      context.changeThemeMode(state.isDarkMode);
      context.read<SettingsBloc>().add(SettingsResetListenerEvent());
    }
  }

  void _logoutSuccess(BuildContext context, SettingsState state) {
    if (state.listener == SettingsListener.logoutSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouter.loginRoute,
        (_) => false,
      );
      context.read<SettingsBloc>().add(SettingsResetListenerEvent());
    }
  }
}
