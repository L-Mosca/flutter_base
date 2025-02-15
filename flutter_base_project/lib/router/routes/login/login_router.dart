import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => BlocProvider(
        create: (_) => _bloc,
        child: const LoginPage(),
      );

  static LoginBloc get _bloc =>
      LoginBloc(injector.get<UserRepository>())..add(LoginInitEvent());
}
