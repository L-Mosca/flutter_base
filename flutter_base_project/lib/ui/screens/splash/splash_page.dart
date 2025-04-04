import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_event.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_state.dart';
import 'package:flutter_base_project/ui/screens/splash/widgets/splash_icon.dart';
import 'package:flutter_base_project/ui/screens/splash/widgets/splash_title.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return BasePage<SplashBloc, SplashEvent, SplashState>(
      listener: _onPageChange,
      builder: _pageContent,
    );
  }

  void _onPageChange(BuildContext context, SplashState state) {
    if (state.listener == SplashListener.showLogin) _showLogin();
    if (state.listener == SplashListener.showHome) _showHome();
  }

  Widget _pageContent(BuildContext context, SplashState state) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SplashIcon(), SplashTitle()],
        ),
      ),
    );
  }

  void _showLogin() => Navigator.popAndPushNamed(context, AppRouter.loginRoute);

  void _showHome() => Navigator.popAndPushNamed(context, AppRouter.homeRoute);
}
