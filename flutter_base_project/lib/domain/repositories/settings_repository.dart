abstract interface class SettingsRepository {
  Future<void> setThemeMode({required bool isDarkMode});
  Future<bool> getThemeMode();
}