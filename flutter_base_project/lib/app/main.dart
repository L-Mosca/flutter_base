import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.initialize();
  runApp(App());
}
