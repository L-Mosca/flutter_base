import 'package:flutter_base_project/domain/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/domain/dto/login/login_response_dto.dart';
import 'package:flutter_base_project/domain/dto/user/user_dto.dart';

abstract interface class UserRepository {
  Future<LoginResponseDto> login({required LoginBodyDto loginBody});
  Future<UserDto> getGenericUser();
}