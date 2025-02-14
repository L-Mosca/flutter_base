import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/localization_provider.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/localization/delegate/app_localization_delegate.dart';
import 'package:flutter_base_project/localization/strings/en_us/en_us.dart';
import 'package:flutter_base_project/localization/strings/pt_br/pt_br.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/system_design/themes/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _locale;
  ThemeMode? _themeMode;

  void _setLocale(Locale locale) => {setState(() => _locale = locale)};

  void _setTheme(ThemeMode theme) => {setState(() => _themeMode = theme)};

  @override
  Widget build(BuildContext context) {
    return LocalizationProvider(
      locale: _locale,
      setLocale: _setLocale,
      child: ThemeProvider(
        themeMode: _themeMode,
        setThemeMode: _setTheme,
        child: MaterialApp(
          locale: _locale,
          themeMode: _themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routes: AppRouter.routes,
          initialRoute: "/",
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
        ),
      ),
    );
  }

  Iterable<Locale> get _supportedLocales =>
      const [Locale("pt", "BR"), Locale("en", "US")];

  Iterable<LocalizationsDelegate<dynamic>>? get _localizationsDelegates => [
    AppLocalizationDelegate(
      ptBrLocalization: PtBr(),
      enUsLocalization: EnUs(),
    ),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
