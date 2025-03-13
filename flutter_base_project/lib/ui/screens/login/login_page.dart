import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/device/device_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<LoginBloc, LoginEvent, LoginState>(
      listener: _onPageChange,
      builder: _pageContent,
    );
  }

  void _onPageChange(BuildContext context, LoginState state) {
    _loginSuccess(context, state);
    _loginError(context, state);
  }

  Widget _pageContent(BuildContext context, LoginState state) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.showSnackBar(message: "Teste da snack bar");
          },
          child: Container(
            width: 300.0,
            height: 300.0,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  void _loginSuccess(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.loginSuccess) {
      // show home here
      //context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }

  void _loginError(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.loginError) {
      context.showSnackBar(message: context.strings.loginFailure);
      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }
}
