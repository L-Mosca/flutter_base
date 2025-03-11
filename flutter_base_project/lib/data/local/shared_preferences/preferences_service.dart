import 'package:flutter_base_project/data/local/shared_preferences/base_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService implements BasePreferences {
  final SharedPreferences sharedPreferences;

  PreferencesService({required this.sharedPreferences});
}