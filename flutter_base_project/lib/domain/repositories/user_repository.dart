import 'package:flutter_base_project/data/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/domain/models/login/login_response.dart';
import 'package:flutter_base_project/domain/models/user/user.dart';

abstract interface class UserRepository {
  Future<LoginResponse> login({required LoginBodyDto loginBody});
  Future<User> getGenericUser();
}