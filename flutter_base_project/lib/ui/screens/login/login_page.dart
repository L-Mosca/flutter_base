import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/bottom_header/login_bottom_header.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/fields/login_fields.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/login_button.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/top_header/login_top_header.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_base_project/utils/device/device_extensions.dart';
import 'package:flutter_base_project/utils/device/device_utils.dart';
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
    _fieldError(context, state);
    _loginSuccess(context, state);
    _loginError(context, state);
  }

  Widget _pageContent(BuildContext context, LoginState state) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => DeviceUtils.hideKeyboard(context),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _scrollView(
                children: [
                  LoginTopHeader(),
                  LoginFields(
                    username: state.username,
                    password: state.password,
                    usernameChanged: (text) => _onUsernameChange(context, text),
                    passwordChanged: (text) => _onPasswordChange(context, text),
                    onSubmitted: (text) => _onPasswordSubmitted(context, text),
                  ),
                ],
              ),
              LoginButton(
                onPressed: () => _onLoginPressed(context),
                showLoading: state.showLoading,
              ),
              LoginBottomHeader(
                onGenerateUserPressed: () => _onGenerateUserPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scrollView({required List<Widget> children}) {
    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  void _onUsernameChange(BuildContext context, String username) =>
      context.read<LoginBloc>().add(LoginUpdateEmailEvent(email: username));

  void _onPasswordChange(BuildContext context, String password) =>
      context.read<LoginBloc>().add(LoginUpdatePasswordEvent(password: password));

  void _onPasswordSubmitted(BuildContext context, String password) {
    DeviceUtils.hideKeyboard(context);
    context.read<LoginBloc>().add(LoginSignInEvent());
  }

  void _onLoginPressed(BuildContext context) {
    DeviceUtils.hideKeyboard(context);
    context.read<LoginBloc>().add(LoginSignInEvent());
  }

  void _onGenerateUserPressed(BuildContext context) {
    DeviceUtils.hideKeyboard(context);
    context.read<LoginBloc>().add(LoginFetchUserEvent());
  }

  void _loginSuccess(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.loginSuccess) {
      // show home here
      //context.read().add(LoginResetListenerEvent());
    }
  }

  void _loginError(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.loginError) {
      context.showSnackBar(message: context.strings.loginFailure);
      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }

  void _fieldError(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.invalidUsername) {
      context.showSnackBar(message: context.strings.invalidUsername);
      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }

    if (state.listener == LoginListener.invalidPassword) {
      context.showSnackBar(message: context.strings.invalidPassword);
      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }
}
