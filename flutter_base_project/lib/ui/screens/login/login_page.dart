import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_base_project/base/page/base_stateless_page.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class LoginPage extends BaseStatelessPage<LoginBloc, LoginEvent, LoginState> {
  const LoginPage({super.key});

  @override
  void onPageChanged(BuildContext context, LoginState state) {

  }

  @override
  Widget pageContent(BuildContext context, LoginState state) {
    return Container(color: AppColors.accent);
  }

}