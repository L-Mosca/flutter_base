abstract class SettingsEvent {}

class SettingsInitEvent extends SettingsEvent {}

class SettingsChangeThemeEvent extends SettingsEvent {
  final bool isDarkMode;

  SettingsChangeThemeEvent({required this.isDarkMode});
}

class SettingsLogoutEvent extends SettingsEvent {}

class SettingsResetListenerEvent extends SettingsEvent {}
