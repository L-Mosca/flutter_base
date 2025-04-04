import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/repositories/settings_repository.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_event.dart';
import 'package:flutter_base_project/ui/screens/settings/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({required this.settingsRepository})
      : super(const SettingsState()) {
    on<SettingsInitEvent>(_init);
    on<SettingsChangeThemeEvent>(_changeTheme);
  }

  void _init(
    SettingsInitEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final isDarkMode = await settingsRepository.getThemeMode();
        emitter(state.setIsDarkMode(isDarkMode));
      },
    );
  }

  void _changeTheme(
    SettingsChangeThemeEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        await settingsRepository.setThemeMode(isDarkMode: event.isDarkMode);
        emitter(state.setIsDarkMode(event.isDarkMode));
      },
    );
  }
}
