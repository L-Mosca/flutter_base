import 'package:flutter_base_project/domain/dto/login/login_body_dto.dart';

class LoginBody {
  String username;
  String password;

  LoginBody({required this.username, required this.password});

  @override
  String toString() {
    return 'LoginBody{username: $username, password: $password}';
  }
}

extension LoginBodyExtension on LoginBody {
  LoginBodyDto toLoginBodyDto() {
    return LoginBodyDto(username: username, password: password);
  }
}