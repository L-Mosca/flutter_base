import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/settings_repository.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_bloc.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_event.dart';
import 'package:flutter_base_project/ui/screens/settings/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsRouter {
  const SettingsRouter();

  static Widget get page => BlocProvider(
        create: (_) => SettingsBloc(
          settingsRepository: injector.get<SettingsRepository>(),
          userRepository: injector.get<UserRepository>(),
        )..add(SettingsInitEvent()),
        child: const SettingsPage(),
      );
}
