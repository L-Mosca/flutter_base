import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/data/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/data/dto/login/login_response_dto.dart';
import 'package:flutter_base_project/data/dto/user/user_dto.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final ClientHelper clientHelper;

  UserRepositoryImpl({required this.clientHelper});

  @override
  Future<UserDto> getGenericUser() async {
    return await clientHelper.getGenericUser();
  }

  @override
  Future<LoginResponseDto> login({required LoginBodyDto loginBody}) async {
    return await clientHelper.login(loginBody: loginBody);
  }
}