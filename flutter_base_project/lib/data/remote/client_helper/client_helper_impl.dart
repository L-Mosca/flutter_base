import 'package:flutter_base_project/data/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/data/dto/login/login_response_dto.dart';
import 'package:flutter_base_project/data/dto/user/user_dto.dart';
import 'package:flutter_base_project/data/remote/client/app_client.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/utils/constants/api_constants.dart';

class ClientHelperImpl implements ClientHelper {
  final AppClient client;

  ClientHelperImpl({required this.client});

  @override
  Future<UserDto> getGenericUser() async {
    final data = await client.get(url: APIConstants.getGenericUser);
    return UserDto.fromJson(data);
  }

  @override
  Future<LoginResponseDto> login({required LoginBodyDto loginBody}) async {
    final data = await client.post(
      url: APIConstants.login,
      body: loginBody.toJson(),
    );

    return LoginResponseDto.fromJson(data);
  }
}
