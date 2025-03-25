import 'package:flutter/material.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_event.dart';
import 'package:flutter_base_project/ui/screens/splash/bloc/splash_state.dart';
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

  void _onPageChange(BuildContext context, SplashState state) {}

  Widget _pageContent(BuildContext context, SplashState state) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.loginRoute);
      },
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(),
      ),
    );
  }
}
