# flutter_base
flutter base project

## Project Structure

```
assets
lib
    app
    base
       - page
       - providers
       - state_management 
    data
        - local
        - remote
        - repositories
    di
        - modules
    domain
        - models
        - repositorries
        - use_cases
    localization
        - delegate
        - strings
    router
        - routes
    ui
        - screen
        - system_design
            - base_widgets
            - themes
    utils
        - constants
        - device
```
___

### assets
* **fonts** => App custom fonts.
* **icons** => App icons (svg format).
* **images** => App images (png format).

### app
* **app.dart** => App widget.
* **main.dart** => Setup dependency injection and run app.

### base
* **page** => base stateless and stateFull pages class.
* **providers** => localization and theme provider.
* **state_management** => base BLoC/State/Event related classes.

### data
* **local** => local data storage.
* **remote** => remote data (api, services...)
* **repositories** => repositories implementation.

### di
* **modules** => App dependencies injection modules.

### domain
* **models** => App model classes.
* **repositories** => Repositories interfaces.
* **use_cases** => Use case classes.

### localization
* **delegate** => Localization delegate.
* **strings** => App static texts (messages).

### router
* **routes** => App routes by context (home route, splash route...).

### ui
* **screens** => App screens (splash, home).
* **system_design** => App base widgets and themes settings.

### utils
* **constants** => App constants values (colors, api constants, dimensions).
* **device** => Devices util functions (get OS type, screen size, keyboard functions...).

___

## Architecture

To follow Flutter documentation and native app development best practices, I chose the MVVM architecture. Think of the BLoC as a ViewModel class.

All logic is placed inside the BLoC (except in some cases, like animations).


## Layers

The software is divided into three main layers:

<img src="screenshots/layers.png" alt="app layer" width="500" height="300"/>

___

### Presentation
Contains widgets, pages, and UI logic.

<img src="screenshots/presentation.png" alt="presentation" width="500" height="500" />

___

### Domain
Contains validators, helpers, and all business logic (BLoC classes).

<img src="screenshots/domain.png" alt="domain" width="500" height="500" />

### Data 
Responsible for fetching data (from internal or external sources). Contains repositories, API clients, DTO classes, etc.

<img src="screenshots/data.png" alt="data" width="500" height="500" />

___

## Dependency injection

In this app, I created my own Injector class that uses the [GetIt](https://pub.dev/packages/get_it) package to provide class instances following the Singleton pattern.
This makes the dependency injection independent of any external package, since GetIt can easily be replaced by any other dependency injection solution if needed.

<img src="screenshots/di.png" alt="presentation" width="600" height="500" />

___

## Navigation

>To understand how navigation works, you need to know how a stack memory works, as it is used to store the navigation routes.

This app use [Flutter Navigator class](https://api.flutter.dev/flutter/widgets/Navigator-class.html).

I created the AppRouter class to manage all things about this topic.

* constants
* route generation
* transition animation

### Constants
Contains routes names and routes arguments keys:
```
  // Route constants
  static const splashRoute = "/";
  static const homeRoute = "/home";
  static const loginRoute = "/login";
  static const productDetailRoute = "/productDetail";
  static const settingsRoute = "/settings";
  static const cartRoute = "/cart";

  // Route arguments
  static const productDetailIdArgument = "productDetailId";
```

### Route generation
AppRouter.onGenerateRoute return the correct routes through routes names and it's used on [MaterialApp.onGenerateRoute callback](https://api.flutter.dev/flutter/material/MaterialApp/onGenerateRoute.html).
```
static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    BuildContext context,
  ) {
    switch (settings.name) {
      case splashRoute: return _buildPageWithAnimation(SplashRouter.page);
      case homeRoute: return _buildPageWithAnimation(HomeRouter.page);
      case loginRoute: return _buildPageWithAnimation(LoginRouter.page);
      case productDetailRoute: return _buildPageWithAnimation(ProductDetailRouter.page(context, settings), RouteAnimation.scale);
      case settingsRoute: return _buildPageWithAnimation(SettingsRouter.page);
      case cartRoute: return _buildPageWithAnimation(CartRouter.page, RouteAnimation.scale);
      default: return null;
    }
  }
```

### Transition Animation
AppRouter._buildPageWithAnimation return a Route with a custom transition animation. You can use RouteAnimation enum to choose an animation type:
```
enum RouteAnimation { rightToLeft, fade, scale }

static PageRouteBuilder _buildPageWithAnimation(
    Widget page, [
    RouteAnimation pageAnimation = RouteAnimation.rightToLeft,
  ]) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        if (pageAnimation == RouteAnimation.fade) return _fadeAnimation(context, animation, child);

        if (pageAnimation == RouteAnimation.scale) return _scaleAnimation(context, animation, child);

        return _rightToLeftAnimation(context, animation, child);
      },
      transitionDuration: AppConstants.defaultPageAnimationDuration,
    );
  }
```
___

## Material App Localization
This app support Pt-BR and En-US locales. To understaing this proccess you must to know aboult MaterialApp [localizationsDelegates](https://api.flutter.dev/flutter/material/MaterialApp/localizationsDelegates.html) and [supportedLocales](https://api.flutter.dev/flutter/material/MaterialApp/supportedLocales.html).

### Supported Languages Strings

I create AppLocalization class to define all app Strings and localization/strings contains one package for each supported language (../localization/strings/en_us and ../localizarion/strings/pt_br).
The classes EnUs and PtBr extends AppLocalization and must to define all app strings.
```
abstract class AppLocalization {
    String get password;
}

class EnUs extends AppLocalization {
    @override String get password => "Password";
}

class PtBr implements AppLocalization {
    @override String get password => "Senha";
}
```

### Localization Delegate
AppLocalizationDelegate class it's used on MaterialApp.localizationsDelegates and contains all App supported languages class (EnUs and PtBr). It provides the correct archive according current locale:

```
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
```

## Localization Provider
I wrap MaterialApp widget with an InheritedWidget called LocalizarionProvider.

This widget manage and notify locale changes dinamically to all widgets.

```
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
```

Extension functions to get and set locale:
```
/// Run time locale extensions
/// -> getLocale => Current app locale;
/// -> setLocale => Change locale and switch supported string resources
extension LocaleProviderExtensions on BuildContext {
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
```

___

## App Themes (color scheme)
This app has two different color schemes: Dark and Light.

>All these configurations are used to automatically provide basic color properties to all your widgets for both light and dark modes.

>If you want to define custom colors for your widgets according to the app's theme, go to Custom Colors.

### Setup on Material App
To setup this schemes on Material app, use [theme](https://api.flutter.dev/flutter/material/MaterialApp/theme.html) and [darkTheme](https://api.flutter.dev/flutter/material/MaterialApp/darkTheme.html) properties.

**AppTheme** class contains a basic Material preset themes.

>You can check all presets on ../ui/system_design/themes/custom_themes directory.

```
On MaterialApp
theme: AppTheme.lightTheme,
darkTheme: AppTheme.darkTheme,


AppTheme class
/// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightTextFieldTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: CustomTextTheme.darkTextTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
      chipTheme: CustomChipTheme.darkChipTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: CustomTextFieldTheme.darkTextFieldTheme);
```
___

**Theme Provider**
I wrap MaterialApp widget with an InheritedWidget called ThemeProvider.

This widget manage and notify ThemeMode changes dinamically to all widgets.

```
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
```

Extension functions to get and set theme mode:
```
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

  void changeThemeMode(bool isDarkMode) {
    final newTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    setThemeMode(newTheme);
  }

  void switchThemeMode() {
    final newTheme = isDarkMode() ? ThemeMode.light : ThemeMode.dark;
    setThemeMode(newTheme);
  }

  bool isDarkMode() => getThemeMode() == ThemeMode.dark;
}
```

___

## Custom Colors
This feature is important to provide custom colors without bureocratic logic nacos.

### Color Token

To do this i create abstract class ColorToken. This class declares all custom colors.
```
abstract class ColorToken {
    Color get border;
}
```

Now i extends this class on LightColorToken and DarkColorToken and set diferent colors for each app Brightness status:
```
class LightColorToken implements ColorToken {
    @override Color get border => AppColors.borderLight;
}

class DarkColorToken implements ColorToken {
    @override Color get border => AppColors.borderDark;
}
```

### Color Token Provider

It's an InheritedWidget called ColorTokenProvider inside MaterialApp.builder.

This widget set correct ColorToken archive by app Brightness status (light or dark).

```
inside MaterialApp.builder

final brightness = Theme.of(context).brightness;
final colorToken = brightness == Brightness.dark ? DarkColorToken() : LightColorToken();

return ColorTokenProvider(colorToken: colorToken, child: child!);


Proivder class:

class ColorTokenProvider extends InheritedWidget {
  final ColorToken colorToken;

  const ColorTokenProvider({
    super.key,
    required this.colorToken,
    required super.child,
  });

  static ColorToken of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ColorTokenProvider>();
    assert(provider != null, 'ColorTokenProvider not found in context');
    return provider!.colorToken;
  }

  @override
  bool updateShouldNotify(covariant ColorTokenProvider oldWidget) {
    return oldWidget.colorToken != colorToken;
  }
}
```

Call colors by provider extension function:

```
extension ColorTokenExtension on BuildContext {
  ColorToken get colors => ColorTokenProvider.of(this);
}

Call color by token using this function: context.colors.border;
```
