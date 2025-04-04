abstract class SettingsEvent {}

class SettingsInitEvent extends SettingsEvent {}

class SettingsChangeThemeEvent extends SettingsEvent {
  final bool isDarkMode;

  SettingsChangeThemeEvent({required this.isDarkMode});
}