import 'package:flutter_base_project/data/local/shared_preferences/base_preferences.dart';
import 'package:flutter_base_project/data/local/shared_preferences/helper/preferences_helper.dart';
import 'package:flutter_base_project/data/local/shared_preferences/helper/preferences_helper_impl.dart';
import 'package:flutter_base_project/data/local/shared_preferences/preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModule {
  static Future<void> setup(GetIt getIt) async {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<BasePreferences>(
      PreferencesService(sharedPreferences: prefs),
    );

    getIt.registerSingleton<PreferencesHelper>(
      PreferencesHelperImpl(prefs: getIt<PreferencesService>()),
    );
  }
}
