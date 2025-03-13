import 'package:flutter_base_project/base/state_management/copyable.dart';

enum LoginStatus { initial }

enum LoginListener { nothing, loginSuccess, loginError }

class LoginState implements Copyable<LoginState> {
  const LoginState({
    this.status = LoginStatus.initial,
    this.listener = LoginListener.nothing,
    this.email = "",
    this.password = "",
  });

  final LoginStatus status;
  final LoginListener listener;
  final String email;
  final String password;

  @override
  LoginState copy() {
    return LoginState(
      status: status,
      listener: listener,
      email: email,
      password: password,
    );
  }

  @override
  LoginState copyWith({
    LoginStatus? status,
    LoginListener? listener,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      listener: listener ?? this.listener,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  LoginState updateEmail(String text) => copyWith(email: text);

  LoginState updatePassword(String text) => copyWith(password: text);

  LoginState get resetListener => copyWith(listener: LoginListener.nothing);
}
