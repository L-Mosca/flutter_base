import 'package:flutter_base_project/base/state_management/copyable.dart';

enum SettingsListener { nothing, changeTheme, logoutSuccess }

class SettingsState implements Copyable<SettingsState> {
  const SettingsState({
    this.listener = SettingsListener.nothing,
    this.isDarkMode = false,
  });

  final SettingsListener listener;
  final bool isDarkMode;

  @override
  SettingsState copy() {
    return SettingsState(
      listener: listener,
      isDarkMode: isDarkMode,
    );
  }

  @override
  SettingsState copyWith({
    SettingsListener? listener,
    bool? isDarkMode,
  }) {
    return SettingsState(
      listener: listener ?? this.listener,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  SettingsState setIsDarkMode(bool darkMode) =>
      copyWith(listener: SettingsListener.changeTheme, isDarkMode: darkMode);

  SettingsState get logoutSuccess =>
      copyWith(listener: SettingsListener.logoutSuccess);

  SettingsState get resetListener =>
      copyWith(listener: SettingsListener.nothing);
}
