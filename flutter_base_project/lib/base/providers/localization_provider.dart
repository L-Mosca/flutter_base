import 'package:flutter/widgets.dart';

/// Use to manage main app widget state
/// At this moment, this widget notify localization changes to switch supported strings
class LocalizationProvider extends InheritedWidget {
  final Locale? locale;
  final Function(Locale) setLocale;

  const LocalizationProvider({
    super.key,
    required super.child,
    required this.locale,
    required this.setLocale,
  });

  static LocalizationProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocalizationProvider>()!;
  }

  @override
  bool updateShouldNotify(LocalizationProvider oldWidget) {
    return locale != oldWidget.locale;
  }
}

/// Run time locale extensions
/// -> getLocale => Current app locale;
/// -> setLocale => Change locale and switch supported string resources
extension StateProviderExtensions on BuildContext {
  Locale getLocale() {
    final locale = LocalizationProvider.of(this).locale;
    if (locale == null) {
      final newLocale = View.of(this).platformDispatcher.locale;
      setLocale(newLocale);
      return newLocale;
    }

    return locale;
  }

  void setLocale(Locale locale) {
    LocalizationProvider.of(this).setLocale(locale);
  }
}