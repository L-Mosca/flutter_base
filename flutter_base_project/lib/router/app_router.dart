import 'package:flutter/material.dart';
import 'package:flutter_base_project/router/routes/home/home_router.dart';
import 'package:flutter_base_project/router/routes/splash/splash_router.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => SplashRouter.page,
      "/home": (context) => HomeRouter.page,
    };
  }
}
