import 'package:flutter_base_project/data/dto/login/login_response_dto.dart';
import 'package:flutter_base_project/data/dto/user/user_dto.dart';
import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/domain/models/login/login_body.dart';
import 'package:flutter_base_project/domain/models/login/login_response.dart';
import 'package:flutter_base_project/domain/models/user/user.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientHelper clientHelper;
  final PreferencesHelper preferencesHelper;

  UserRepositoryImpl({
    required this.clientHelper,
    required this.preferencesHelper,
  });

  @override
  Future<User> getGenericUser() async {
    final data = await clientHelper.getGenericUser();
    return data.toUser();
  }

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {

    // Do login
    final body = LoginBody(username: username, password: password);
    final data = await clientHelper.login(loginBody: body.toLoginBodyDto());

    // Save user token
    final token = data.token ?? "";
    if (token.isNotEmpty) await preferencesHelper.saveUserToken(token: token);

    return data.toLoginResponse();
  }

  @override
  Future<String?> getUserToken() async {
    return await preferencesHelper.getUserToken();
  }

  @override
  Future<void> saveUserToken({required String token}) async {
    await preferencesHelper.saveUserToken(token: token);
  }

  @override
  Future<bool> isLogged() async {
    final token = await preferencesHelper.getUserToken();
    return token != null && token.isNotEmpty;
  }
}
