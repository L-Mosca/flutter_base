import 'package:flutter/material.dart';
import 'package:flutter_base_project/router/routes/home/home_router.dart';
import 'package:flutter_base_project/router/routes/login/login_router.dart';
import 'package:flutter_base_project/router/routes/splash/splash_router.dart';

class AppRouter {
  // Route constants
  static const splashRoute = "/";
  static const homeRoute = "/home";
  static const loginRoute = "/login";

  static Map<String, WidgetBuilder> get routes {
    return {
      splashRoute: (context) => SplashRouter.page,
      homeRoute: (context) => HomeRouter.page,
      loginRoute: (context) => LoginRouter.page,
    };
  }
}
