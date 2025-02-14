import 'package:flutter_base_project/base/state_management/copyable.dart';

enum LoginStatus { initial }

class LoginState implements Copyable<LoginState> {
  const LoginState({
    this.status = LoginStatus.initial,
  });

  final LoginStatus status;

  @override
  LoginState copy() {
    return LoginState(status: status);
  }

  @override
  LoginState copyWith({LoginStatus? status}) {
    return LoginState(status: status ?? this.status);
  }
}
