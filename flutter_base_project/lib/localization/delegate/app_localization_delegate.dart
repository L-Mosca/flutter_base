import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/strings/app_localization.dart';
import 'package:flutter_base_project/localization/strings/en_us/en_us.dart';
import 'package:flutter_base_project/localization/strings/pt_br/pt_br.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final PtBr ptBrLocalization;
  final EnUs enUsLocalization;

  Locale? _lastLocale;

  AppLocalizationDelegate({
    required this.ptBrLocalization,
    required this.enUsLocalization,
  });

  AppLocalization? appLocalizations;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(
      context,
      AppLocalization,
    )!;
  }

  @override
  bool isSupported(Locale locale) {
    _lastLocale = locale;
    return locale == const Locale("pt", "BR") ||
        locale == const Locale("en", "US");
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    appLocalizations = locale == const Locale("pt", "BR")
        ? ptBrLocalization
        : enUsLocalization;

    return appLocalizations!;
  }

  @override
  bool shouldReload(covariant AppLocalizationDelegate old) {
    return _lastLocale != old._lastLocale;
  }
}
