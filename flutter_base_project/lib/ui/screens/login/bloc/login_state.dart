import 'package:flutter_base_project/base/state_management/copyable.dart';

enum LoginStatus { initial }

enum LoginListener {
  nothing,
  loginSuccess,
  loginError,
  invalidUsername,
  invalidPassword,
}

class LoginState implements Copyable<LoginState> {
  const LoginState({
    this.status = LoginStatus.initial,
    this.listener = LoginListener.nothing,
    this.username = "",
    this.password = "",
    this.showLoading = false,
  });

  final LoginStatus status;
  final LoginListener listener;
  final String username;
  final String password;
  final bool showLoading;

  @override
  LoginState copy() {
    return LoginState(
      status: status,
      listener: listener,
      username: username,
      password: password,
      showLoading: showLoading,
    );
  }

  @override
  LoginState copyWith({
    LoginStatus? status,
    LoginListener? listener,
    String? username,
    String? password,
    bool? showLoading,
  }) {
    return LoginState(
      status: status ?? this.status,
      listener: listener ?? this.listener,
      username: username ?? this.username,
      password: password ?? this.password,
      showLoading: showLoading ?? this.showLoading,
    );
  }

  LoginState updateEmail(String text) => copyWith(username: text);

  LoginState updatePassword(String text) => copyWith(password: text);

  LoginState updateCredentials(String username, String password) => copyWith(
        username: username,
        password: password,
      );

  LoginState isLoading(bool isLoading) => copyWith(showLoading: isLoading);

  LoginState get invalidUsername => copyWith(
        listener: LoginListener.invalidUsername,
      );

  LoginState get invalidPassword => copyWith(
        listener: LoginListener.invalidPassword,
      );

  LoginState get loginSuccess => copyWith(listener: LoginListener.loginSuccess);

  LoginState get loginError => copyWith(listener: LoginListener.loginError);

  LoginState get resetListener => copyWith(listener: LoginListener.nothing);
}
