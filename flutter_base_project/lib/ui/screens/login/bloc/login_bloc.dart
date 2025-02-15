import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/data/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc(this._userRepository) : super(const LoginState()) {
    on<LoginInitEvent>(_init);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emitter) async {
    await defaultLaunch(
      function: () async {
        final body = LoginBodyDto(username: "mor_2314", password: "83r5^_");
        final test = await _userRepository.login(loginBody: body);
        emitter(state.copyWith(status: LoginStatus.initial));
      },
      exceptionHandler: (exception) {},
    );
  }
}
