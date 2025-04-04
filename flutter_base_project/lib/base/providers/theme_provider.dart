import 'package:flutter/material.dart';

/// Use to manage main app widget state
/// At this moment, this widget notify themes changes.
class ThemeProvider extends InheritedWidget {
  final ThemeMode? themeMode;
  final Function(ThemeMode) setThemeMode;

  const ThemeProvider({
    super.key,
    required super.child,
    required this.themeMode,
    required this.setThemeMode,
  });

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    if (themeMode == null) return false;
    return themeMode != oldWidget.themeMode;
  }
}

/// Runtime theme mode extensions
/// -> getThemeMode => Current app theme mode;
/// -> setThemeMode => Change theme mode and switch between dark and light themes
extension ThemeProviderExtensions on BuildContext {
  ThemeMode getThemeMode() {
    final theme = ThemeProvider.of(this).themeMode;
    if (theme == null) {
      return (MediaQuery.of(this).platformBrightness == Brightness.dark)
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    return theme;
  }

  void setThemeMode(ThemeMode themeMode) {
    ThemeProvider.of(this).setThemeMode(themeMode);
  }

  void switchThemeMode() {
    final newTheme = isDarkMode() ? ThemeMode.light : ThemeMode.dark;
    setThemeMode(newTheme);
  }

  bool isDarkMode() => getThemeMode() == ThemeMode.dark;
}
