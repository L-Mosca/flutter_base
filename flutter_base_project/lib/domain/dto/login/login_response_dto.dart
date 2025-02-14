import 'package:flutter_base_project/domain/models/login/login_response.dart';

class LoginResponseDto {
  String? token;

  LoginResponseDto({this.token});

  @override
  String toString() {
    return 'LoginResponseDto{token: $token}';
  }

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }
}

extension LoginResponseDtoExtension on LoginResponseDto? {
  LoginResponse toLoginResponse() {
    return LoginResponse(token: this?.token ?? "");
  }
}