import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository{
  final PreferencesHelper preferencesHelper;

  SettingsRepositoryImpl({required this.preferencesHelper});

  @override
  Future<bool> getThemeMode() async {
    return await preferencesHelper.getThemeMode();
  }

  @override
  Future<void> setThemeMode({required bool isDarkMode}) async {
    await preferencesHelper.saveThemeMode(isDarkMode: isDarkMode);
  }
}