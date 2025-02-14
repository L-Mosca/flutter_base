import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {

  LoginBloc() : super(const LoginState()) {
    on<LoginInitEvent>(_init);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emitter) async {
    await defaultLaunch(
      function: () async {
        emitter(state.copyWith(status: LoginStatus.initial));
      },
      exceptionHandler: (exception) {},
    );
  }
}
