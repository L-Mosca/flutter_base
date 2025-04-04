import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/di/injector.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.initialize();
  final isDarkMode = await injector.get<PreferencesHelper>().getThemeMode();
  runApp(App(isDarkMode: isDarkMode));
}
