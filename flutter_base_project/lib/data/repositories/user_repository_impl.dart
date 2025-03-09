import 'package:flutter_base_project/data/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/data/dto/login/login_response_dto.dart';
import 'package:flutter_base_project/data/dto/user/user_dto.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/domain/models/login/login_response.dart';
import 'package:flutter_base_project/domain/models/user/user.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientHelper clientHelper;

  UserRepositoryImpl({required this.clientHelper});

  @override
  Future<User> getGenericUser() async {
    final data = await clientHelper.getGenericUser();
    return data.toUser();
  }

  @override
  Future<LoginResponse> login({required LoginBodyDto loginBody}) async {
    final data = await clientHelper.login(loginBody: loginBody);
    return data.toLoginResponse();
  }
}
