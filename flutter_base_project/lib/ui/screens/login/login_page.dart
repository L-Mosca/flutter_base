import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<LoginBloc, LoginEvent, LoginState>(
      listener: _onPageChange,
      builder: _pageContent,
    );
  }

  void _onPageChange(BuildContext context, LoginState state) {}

  Widget _pageContent(BuildContext context, LoginState state) {
    return SizedBox();
  }
}
