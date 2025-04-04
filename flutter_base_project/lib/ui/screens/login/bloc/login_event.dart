abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class LoginUpdateEmailEvent extends LoginEvent {
  final String email;

  LoginUpdateEmailEvent({required this.email});
}

class LoginUpdatePasswordEvent extends LoginEvent {
  final String password;

  LoginUpdatePasswordEvent({required this.password});
}

class LoginSignInEvent extends LoginEvent {}

class LoginFetchUserEvent extends LoginEvent {}

class LoginResetListenerEvent extends LoginEvent {}
