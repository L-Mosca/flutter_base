import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper_impl.dart';
import 'package:get_it/get_it.dart';

class DataModule {
  static Future<void> setup(GetIt getIt) async {
    final preferencesHelper = await PreferencesHelperImpl.create();
    getIt.registerSingleton<PreferencesHelper>(preferencesHelper);
  }
}
