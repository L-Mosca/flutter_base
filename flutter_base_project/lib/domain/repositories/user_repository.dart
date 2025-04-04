import 'package:flutter_base_project/domain/models/login/login_response.dart';
import 'package:flutter_base_project/domain/models/user/user.dart';

abstract interface class UserRepository {
  Future<LoginResponse> login({
    required String username,
    required String password,
  });

  Future<void> logout();

  Future<User> getGenericUser();

  Future<void> saveUserToken({required String token});

  Future<String?> getUserToken();

  Future<bool> isLogged();
}
